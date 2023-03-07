#!/bin/bash

for dir in $(jq -r 'keys[]' tags.json); do
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
done

git submodule status
git status
