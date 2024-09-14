set shell := ["bash", "-c"]

OUT_DIR := "output"
CONTENT_DIR := "content"

clean:
  -rm -r {{OUT_DIR}}
  -rm {{CONTENT_DIR}}/index.md

build-index:
  bash scripts/build_index.sh {{CONTENT_DIR}}

build: clean build-index
  bash scripts/build.sh {{OUT_DIR}}

watch: clean build-index
  bash scripts/build.sh {{OUT_DIR}} watch

serve: watch
  cd output && python -m http.server && cd -
