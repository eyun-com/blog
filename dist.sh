#!/usr/bin/env bash

_dirname=$(realpath $(cd "$(dirname "$0")"; pwd))

cd $_dirname

git add .
branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' |awk -F' ' '{print $2}'`
git commit -m $branch ;
git pull origin $branch && git push origin $branch;

if ! hash hexo 2>/dev/null; then
yarn global add hexo-cli
fi

if [ ! -d node_modules ]; then
yarn
fi

if [ ! -f themes/icarus/_config.yml ]; then
ln -s ../_config/icarus.yml themes/icarus/_config.yml
fi

hexo g -d
