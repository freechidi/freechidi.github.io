if [ "$1" = "" ]; then
  echo "Usage: make_index.sh <content_dir>"
  exit 1
fi

content_dir="$1"

cat > "$1"/index.md << EOL
---
title: I think it's time
date: $(date +%d-%m-%Y)
---

Hope you enjoy.

EOL

for file in "$1"/*.md; do
  filename=`basename ${file%.*}`

  if [ "$filename" != "index" ]; then
    echo "- [$filename.html]($filename.html)" >> "$1"/index.md
  fi
done
