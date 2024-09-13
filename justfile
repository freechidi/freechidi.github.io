set shell := ["bash", "-c"]

OUT_DIR := "output"
CONTENT_DIR := "content"

clean:
  -rm -r {{OUT_DIR}} 

build:
  bash make_index.sh {{CONTENT_DIR}}
  bash build.sh {{OUT_DIR}}

build-clean: clean build 

serve: build-clean
  cd output && python -m http.server && cd -
