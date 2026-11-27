"""Rebuild the even Tunnell proof against its pinned Lean environment."""

import argparse
from concurrent.futures import FIRST_COMPLETED, ThreadPoolExecutor, wait
from graphlib import TopologicalSorter
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys


def verify(root, base, output, jobs):
    manifest_bytes = (root / "manifest.json").read_bytes()
    manifest = json.loads(manifest_bytes)
    modules = manifest["modules"]
    revision = subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=base, text=True
    ).strip()
    if revision != manifest["formalConjectures"]:
        raise ValueError(f"Expected formal-conjectures {manifest['formalConjectures']}, found {revision}")
    environment = json.loads(subprocess.check_output(
        ["lake", "env", sys.executable, "-c", "import json, os; print(json.dumps(dict(os.environ)))"],
        cwd=base, text=True,
    ))
    lean = shutil.which("lean", path=environment["PATH"])
    checker = shutil.which("leanchecker", path=environment["PATH"])
    if not lean or not checker:
        raise ValueError("The pinned toolchain must provide lean and leanchecker.")
    build = output / hashlib.sha256(manifest_bytes).hexdigest()[:16]
    compiled, logs = build / "olean", build / "logs"
    compiled.mkdir(parents=True, exist_ok=True)
    logs.mkdir(exist_ok=True)
    environment["LEAN_PATH"] = str(compiled) + os.pathsep + environment["LEAN_PATH"]
    source = root / "src"
    deps = TopologicalSorter()
    for name, record in modules.items():
        path = Path(*name.split(".")).with_suffix(".lean")
        if hashlib.sha256((source / path).read_bytes()).hexdigest() != record["sha256"]:
            raise ValueError(f"Source checksum failed for {name}")
        deps.add(name, *(d for d in record["imports"] if d in modules))
    deps.prepare()

    def check(name):
        path = Path(*name.split("."))
        obj = (compiled / path).with_suffix(".olean")
        stamp = obj.with_suffix(".ok")
        if stamp.is_file() and obj.is_file():
            return
        obj.parent.mkdir(parents=True, exist_ok=True)
        log = logs / (name + ".log")
        with log.open("w", encoding="utf-8") as stream:
            result = subprocess.run(
                [lean, "-j1", "-DmaxHeartbeats=1600000", "--root=" + str(source), "-o", str(obj),
                 str((source / path).with_suffix(".lean"))],
                cwd=base, env=environment, stdout=stream, stderr=subprocess.STDOUT,
            )
        if result.returncode:
            raise RuntimeError(f"{name} failed. See {log}\n{log.read_text(errors='replace')[-2000:]}")
        stamp.touch()

    pending, ready, count = {}, [], 0
    with ThreadPoolExecutor(max_workers=jobs) as workers:
        while deps.is_active():
            ready.extend(deps.get_ready())
            while ready and len(pending) < jobs:
                name = ready.pop()
                pending[workers.submit(check, name)] = name
            finished, _ = wait(pending, return_when=FIRST_COMPLETED)
            for future in finished:
                name = pending.pop(future)
                future.result()
                deps.done(name)
                count += 1
                if count % 25 == 0 or count == len(modules):
                    print(f"Checked {count}/{len(modules)} modules", flush=True)

    name = manifest["root"]
    audit = (logs / (name + ".log")).read_text(encoding="utf-8")
    match = re.search(r"'TunnellEvenOriginal\.tunnell_even' depends on axioms: \[([^\]]*)\]", audit)
    if not match or {s.strip() for s in match[1].split(",")} != {"propext", "Classical.choice", "Quot.sound"}:
        raise RuntimeError(f"Unexpected axiom audit in {logs / (name + '.log')}")
    subprocess.run([checker, "-v", name], cwd=base, env=environment, check=True)
    subprocess.run([lean, "-j1", str(root / "ExactStatement.lean")],
                   cwd=base, env=environment, check=True)
    print(match[0])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base", required=True, type=Path, help="Pinned, built formal-conjectures checkout")
    parser.add_argument("--build-dir", type=Path, help="Directory for independent compiled output")
    parser.add_argument("--jobs", type=int, default=2, help="Number of simultaneous Lean processes")
    args = parser.parse_args()
    if args.jobs < 1:
        parser.error("--jobs must be positive")
    root = Path(__file__).resolve().parent
    verify(root, args.base.resolve(), (args.build_dir or root / ".build").resolve(), args.jobs)
