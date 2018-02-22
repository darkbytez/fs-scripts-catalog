#!/bin/bash

rm -rf /tmp/branches.scripts
git branch > /tmp/branches.scripts

for a in `cat /tmp/branches.scripts | sed 's/\*//g' | sed 's/ //g'`
do
   git checkout $a
   checkremote=`git ls-remote --heads git@github.com:rbr8791/fs-scripts-catalog.git $a | wc -l`
   if [ $checkremote -eq 0 ]; then
        #echo "The remote branch doesn't exist: $a"
        echo "Creating remote branch: $a"
        git push -u origin $a
   fi
   ./02.commit.changes.sh
done
rm -rf /tmp/branches.scripts
