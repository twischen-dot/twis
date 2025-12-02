#!/bin/bash
set -e
SRC="/Users/macmini/Library/CloudStorage/GoogleDrive-twischen@gmail.com/我的云端硬盘/060 Obsidian/成长足迹"
ROOT_DIR="$(cd "$(dirname "$0")/.."; pwd)"
DST="$ROOT_DIR/zola_site/content/growth"
rsync -av --delete --exclude ".obsidian" --exclude ".DS_Store" "$SRC/" "$DST/"
( if [ ! -f "$DST/_index.md" ]; then 
  cat > "$DST/_index.md" <<'EOF'
+++
title = "成长足迹"
paginate_by = 20
sort_by = "date"
+++
EOF
fi )
( for d in "$DST"/*/; do 
  [ -d "$d" ] || continue; 
  bn="$(basename "$d")";
  if [ ! -f "$d/_index.md" ]; then 
    cat > "$d/_index.md" <<EOF
+++
title = "$bn"
sort_by = "date"
+++
EOF
  fi
done )
(python3 "$ROOT_DIR/scripts/add_front_matter.py" "$DST" || true)
(cd "$ROOT_DIR/zola_site" && zola build)
