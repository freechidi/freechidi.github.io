set shell := ["bash", "-c"]

OUT_DIR := "output"
CONTENT_DIR := "content"

clean:
  -rm -r {{OUT_DIR}}
  -rm {{CONTENT_DIR}}/index.md

build-index: clean
  bash scripts/build_index.sh {{CONTENT_DIR}}

build: clean build-index
  bash scripts/build.sh {{OUT_DIR}}

serve: build
  cd output && python -m http.server && cd -


serve-watch: 
  watchexec -e html,md,css -i "output/*" -r just serve

serve-watch-nix:
  nix-shell -p pandoc watchexec --command "just serve-watch"
