#!/bin/bash

sed -i~ -e '/^## Current Release/,$d' README.md
echo "## Current Release" >> README.md
echo "" >> README.md
echo "This is the list of releases for IN-CORE $(jq -r '."in-core"' tags.json)" >> README.md
echo "" >> README.md
echo "| module | version |" >> README.md
echo "| ------ | ------- |" >> README.md

git submodule update --remote
for dir in $(jq -r 'keys[]' tags.json | sort); do
  if [ "$dir" == "in-core" ]; then continue; fi
  tag=$(jq -r ".\"$dir\"" tags.json)
  if [ "$tag" == "null" ]; then
    echo "[$dir] missing tag"
  else
    if [ ! -d $dir ]; then
      echo "[$dir] missing submodule"
      git submodule add https://github.com/IN-CORE/$dir $dir
    fi
    echo "[$dir] checking out $tag"
    sed -i~ "s/^| $dir | .* |$/| $dir | $tag |/" README.md
    rm README.md~
    (cd $dir; git checkout $tag)
  fi
  echo "| ${dir} | ${tag} |" >> README.md
done

git submodule status
git status
