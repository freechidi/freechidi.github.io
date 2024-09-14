if [ -z "$1" ]; then
  echo "Please enter an output directory"
  exit 1
fi

if [ ! -d "$1" ]; then
  mkdir "$1"
else
  echo "Directory $1 already exists. Please (re)move it or change the output location"
  exit 1
fi

# render pandoc files
for file in content/*; do
  filename=`basename ${file%.*}`
  pandoc --shift-heading-level-by=-1 --template ./template.html "$file" -o "$1/$filename.html"
done

# create symbolic link to static
cp -r --target-directory="$1" static

