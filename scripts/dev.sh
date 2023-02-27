#!/bin/bash

set -e

mv docs/_includes/ _includes
mv docs/_layouts/ _layouts
mv docs/assets/ assets
mv docs/_config.yml _config.yml
mv docs/CNAME CNAME
mv docs/Gemfile Gemfile
mv docs/Gemfile.lock Gemfile.lock
mv docs/.gitignore .gitignore-docs
rm -rf docs
cp -r markdown docs
mv _includes docs/_includes
mv _layouts docs/_layouts
mv assets/ docs/assets
mv _config.yml docs/_config.yml
mv CNAME docs/CNAME
mv Gemfile docs/Gemfile
mv Gemfile.lock docs/Gemfile.lock
mv .gitignore-docs docs/.gitignore
cd docs/
mv *.md index.md 
cd ..
cd docs && ../scripts/replacer.sh
bundle exec jekyll serve
