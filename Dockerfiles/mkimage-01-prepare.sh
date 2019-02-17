#!/bin/bash

set -e

cd $HOME
git clone https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb.git
cd $HOME/gamm-2019-talk-on-conservative-rb
git submodule update --init --recursive

