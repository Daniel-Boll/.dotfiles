#!/usr/bin/env bash

{

git clone https://github.com/Daniel-Boll/.dotfiles ~/.dotfiles

pushd ~/.dotfiles || return

chmod +x arch dependencies install post-install test

./arch
popd || return

}
