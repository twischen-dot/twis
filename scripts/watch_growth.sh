#!/bin/bash
SRC="/Users/macmini/Library/CloudStorage/GoogleDrive-twischen@gmail.com/我的云端硬盘/060 Obsidian/成长足迹"
ROOT_DIR="$(cd "$(dirname "$0")/.."; pwd)"
CMD="$ROOT_DIR/scripts/sync_growth.sh"
if ! command -v fswatch >/dev/null 2>&1; then
  echo "fswatch 未安装，请先运行: brew install fswatch"
  exit 1
fi
while true; do
  fswatch -o "$SRC" | xargs -n1 "$CMD"
done
