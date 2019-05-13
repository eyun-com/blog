#!/usr/bin/env bash

_dirname=$(realpath $(cd "$(dirname "$0")"; pwd))

cd $_dirname

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
