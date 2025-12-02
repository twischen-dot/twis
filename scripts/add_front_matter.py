import os
import sys
from datetime import datetime

def needs_front_matter(path):
    try:
        with open(path, 'r', encoding='utf-8') as f:
            head = f.read(256)
        return not (head.startswith('+++') or head.startswith('---'))
    except Exception:
        return False

def build_front_matter(title, mtime):
    date = datetime.fromtimestamp(mtime).strftime('%Y-%m-%d')
    return f"+++\ntitle = \"{title}\"\ndate = \"{date}\"\n+++\n\n"

def process(root):
    for dirpath, _, filenames in os.walk(root):
        for name in filenames:
            if not name.lower().endswith('.md'):
                continue
            full = os.path.join(dirpath, name)
            if needs_front_matter(full):
                title = os.path.splitext(name)[0]
                mtime = os.path.getmtime(full)
                fm = build_front_matter(title, mtime)
                with open(full, 'r', encoding='utf-8') as f:
                    content = f.read()
                with open(full, 'w', encoding='utf-8') as f:
                    f.write(fm + content)

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('Usage: add_front_matter.py <content_root>')
        sys.exit(1)
    process(sys.argv[1])
