#!/bin/bash

for x in `git status | grep deleted | awk '{print $3}'`; do git rm $x; done
