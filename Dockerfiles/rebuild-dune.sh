#!/bin/bash
#
# This file is part of the ftschindler-work/gamm-2019-talk-on-conservative-rb project:
#   https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb
# The copyright lies with the authors of this file (see below).
# License: BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)

set -e

export BASEDIR=/data/home/gamm-2019-talk-on-conservative-rb
cd $BASEDIR

# load the variables of this environment, sources the virtualenv
source /data/dune/PATH.sh

# build dune
NPROC=1
./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=/data/dune/build configure
./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=/data/dune/build bexec 'make -j$NPROC all'
./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=/data/dune/build bexec 'make -j$NPROC bindings_no_ext || echo no bindings'
./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=/data/dune/build bexec 'make install_python'

