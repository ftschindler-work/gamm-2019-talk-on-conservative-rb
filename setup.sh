#!/bin/bash
#
# This file is part of the ftschindler-work/gamm-2019-talk-on-conservative-rb project:
#   https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb
# The copyright lies with the authors of this file (see below).
# License: BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)

set -e

if [ "X${OPTS}" == "X" ]; then
    echo You have to define OPTS, i.e. export OPTS=gcc-relwithdebinfo
    exit
fi

# define environment in case we are not in one of our dockers
# determines which one to use below environments/
if [ "X${DXT_ENVIRONMENT}" == "X" ]; then
    export DXT_ENVIRONMENT=debian-full
fi

# initialize the virtualenv, if not yet present
export BASEDIR="${PWD}"
mkdir -p e/${DXT_ENVIRONMENT}/venv && \
  [ -e e/${DXT_ENVIRONMENT}/venv/dune-${OPTS} ] || \
  cd e/${DXT_ENVIRONMENT}/venv && \
  virtualenv --python=python3 dune-${OPTS}
cd "${BASEDIR}"
unset BASEDIR

# load the variables of this environment, sources the virtualenv
source e/${DXT_ENVIRONMENT}/PATH.sh

# install python dependencies into the virtualenv
pip install --upgrade pip
pip install -r requirements.txt
cd "${BASEDIR}"
cd pymor && pip install -e .
cd "${BASEDIR}"
./bin/build_external_libraries.py

# build dune
NPROC=$(($(nproc) - 1))
./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=$INSTALL_PREFIX/build-$OPTS configure
./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=$INSTALL_PREFIX/build-$OPTS bexec 'make -j$NPROC all'
./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=$INSTALL_PREFIX/build-$OPTS bexec 'make -j$NPROC bindings_no_ext || echo no bindings'
./dune-common/bin/dunecontrol --opts=config.opts/$OPTS --builddir=$INSTALL_PREFIX/build-$OPTS bexec 'make install_python'

echo
echo "All done! From now on run"
echo "  export OPTS=$OPTS"
echo "  source e/${DXT_ENVIRONMENT}/PATH.sh"
echo "to activate the virtualenv!"
