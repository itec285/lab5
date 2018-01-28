#!/bin/bash

#Script to simplify pushing back to the git repository

git config --global user.email itec285@gmail.com
git config --global user.name Ivan Long
git add *
git commit -m "Auto-Push from system"
git push origin master
