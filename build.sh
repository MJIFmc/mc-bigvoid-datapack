#!/usr/bin/env bash
# 构建：dist/threebody-bigvoid.zip 与 dist/threebody-bigvoid-name-resourcepack.zip
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p dist
rm -f dist/threebody-bigvoid.zip dist/threebody-bigvoid-name-resourcepack.zip

zip_pack() { # $1 = 输出, 其余 = 要打包的路径
  local out="$1"; shift
  if command -v zip >/dev/null 2>&1; then
    zip -qr "$out" "$@"
  else
    python3 - "$out" "$@" <<'PY'
import sys, zipfile, os
out, paths = sys.argv[1], sys.argv[2:]
with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as z:
    for p in paths:
        if os.path.isdir(p):
            for root, dirs, files in os.walk(p):
                for f in files:
                    fp = os.path.join(root, f)
                    z.write(fp, os.path.relpath(fp, "."))
        else:
            z.write(p, p)
PY
  fi
}

zip_pack dist/threebody-bigvoid.zip pack.mcmeta data
(cd optional/name-resourcepack && zip_pack ../../dist/threebody-bigvoid-name-resourcepack.zip pack.mcmeta assets)
echo "built dist/threebody-bigvoid.zip and dist/threebody-bigvoid-name-resourcepack.zip"
