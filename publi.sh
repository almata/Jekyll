#!/bin/bash

git add .
git commit -m "Personal website updated"
git push origin master
cd _site
git checkout CNAME
git add .
git commit -m "Personal website updated"
git push origin master
cd ..
