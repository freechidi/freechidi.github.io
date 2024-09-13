if [[ "$1" == "" ]]; then
  echo "Please enter an output directory"
  exit 1
fi

if [[ ! -d "$1" ]]; then
  mkdir "$1"
else
  echo "Directory $1 already exists. Please (re)move it or change the output name."
fi

# render pandoc files
for file in content/*; do
  filename=`basename ${file%.*}`
  pandoc --template ./template.html $file -o "$1/$filename.html"
done

# create symbolic link to static
if [[ "$2" == "watch" ]]; then
  ln -s ../static "./$1/static"
else
  cp -r --target-directory="$1" static
fi
