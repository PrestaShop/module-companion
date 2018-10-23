#!/bin/bash

mkdir -p tests/libs

git submodule add https://github.com/sstephenson/bats tests/libs/bats
git submodule add https://github.com/ztombol/bats-support tests/libs/bats-support
git submodule add https://github.com/ztombol/bats-assert tests/libs/bats-assert
