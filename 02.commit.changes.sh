#!/bin/bash

currdate=`date +'%m%d%Y-%H%M%S'`
currdir=`pwd | sed 's/\/cygdrive\/c\///g'`
changed_files=$(git status --porcelain | wc -l)

if [ $changed_files -gt 0 ]; then
  ./01.clean.deleted.sh
  echo "Commit changes at $currdate"
  git add .
  git commit -m "Commit changes on $currdir at: $currdate"
  git tag -a "$currdate" -m "Tagging: `date` $currdate"
  git push
  git push origin $currdate
  echo "Directory $currdir: Done!"
else
  echo "No tracking changes at $currdir"
fi
