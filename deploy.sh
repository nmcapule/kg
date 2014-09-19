#!/bin/bash

echo -e "\033[0;32mDeploying updates to Github...\033[0m"

hugo

git add -A

msg="rebuilding site `date`"
if [ $# -eq 1 ]
    then msg="$1"
fi

git commit -m "$msg"

git push origin master
git subtree push --prefix=public git@github.com:nmcapule/kg.git gh-pages

