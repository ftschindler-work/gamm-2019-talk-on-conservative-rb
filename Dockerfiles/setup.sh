#!/bin/bash
#
# This file is part of the ftschindler-work/gamm-2019-talk-on-conservative-rb project:
#   https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb
# The copyright lies with the authors of this file (see below).
# License: BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)

set -e

# initialize the virtualenv
mkdir -p /data/dune/venv && \
  cd /data/dune/venv && \
  virtualenv --python=python3 gamm-2019-talk-on-conservative-rb

# load the variables of this environment, sources the virtualenv
source /data/dune/PATH.sh

export BASEDIR=/data/home/gamm-2019-talk-on-conservative-rb

# install python dependencies into the virtualenv
cd $BASEDIR
pip install --upgrade pip
pip install -r requirements.txt
cd $BASEDIR
cd pymor && pip install -e .
cd $BASEDIR
./bin/build_external_libraries.py

# build dune
cd $BASEDIR
NPROC=$(($(nproc) - 1))
./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=/data/dune/build configure
./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=/data/dune/build bexec 'make -j$NPROC all'
./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=/data/dune/build bexec 'make -j$NPROC bindings_no_ext || echo no bindings'
./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=/data/dune/build bexec 'make install_python'

