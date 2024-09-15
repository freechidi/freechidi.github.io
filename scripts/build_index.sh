if [ -z "$1" ]; then
  echo "Usage: make_index.sh <content_dir>"
  exit 1
fi

content_dir="$1"

cat README.md > "$1"/index.md 

for file in "$1"/*.md; do
  filename=`basename ${file%.*}`
  title=`grep -Po '(?<=^#[^#]).+' $file`
  date=`grep -Po '(?<=date: ).+' $file`

  if [ "$filename" != "index" ]; then
    echo "- [#$filename]($filename.html) | $title" >> "$1"/index.md
  fi
done
