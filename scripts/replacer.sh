#!/bin/bash

find -name '*.md' -exec sed -i 's/\.md/\.html/g' {} \;
find -name '*.md' -exec sed -i 's/<aside>/<div class="note">/g' {} \;
find -name '*.md' -exec sed -i 's/<\/aside>/<\/div>/g' {} \;

(cd ../katex-renderer && find ../docs -name '*.md' -exec cargo run --release -q -- {} \;)

find -name '*.md' -exec sed -i 's/{/\{/g' {} \;
find -name '*.md' -exec sed -i 's/}/\}/g' {} \;
find -name '*.md' -exec sed -i 's/|/\|/g' {} \;
