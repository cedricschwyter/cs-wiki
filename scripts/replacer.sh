#!/bin/bash

find -name '*.md' -exec sed -i 's/\.md/\.html/g' {} \;
find -name '*.md' -exec sed -i 's/<aside>//g' {} \;
find -name '*.md' -exec sed -i 's/<\/aside>//g' {} \;

(cd ../katex-renderer && find ../docs -name '*.md' -exec cargo run --release -q -- {} \;)

find -name '*.md' -exec sed -i 's/{/\\{/g' {} \;
find -name '*.md' -exec sed -i 's/}/\\}/g' {} \;
find -name '*.md' -exec sed -i 's/|/\\|/g' {} \;
