#!/bin/bash

set -e

export OPTS=gcc-relwithdebinfo
cd $HOME/gamm-2019-talk-on-conservative-rb/environments/arch-full
source PATH.sh
cd $HOME/gamm-2019-talk-on-conservative-rb/
./bin/build_external_libraries.py

nice ionice ./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=$PWD/build configure
nice ionice ./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=$PWD/build bexec 'make -j3 all'
nice ionice ./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=$PWD/build bexec 'make -j3 bindings || echo no bindings in this module'

cd $HOME/gamm-2019-talk-on-conservative-rb/pymor
run-in-dune-env pip install -r requirements-optional.txt
run-in-dune-env pip install -e .
