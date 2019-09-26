# This file is part of the ftschindler-work/gamm-2019-talk-on-conservative-rb project:
#   https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb
# The copyright lies with the authors of this file (see below).
# License: BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)

export INSTALL_PREFIX=/data/dune
export CMAKE_FLAGS="-DDUNE_PYTHON_VIRTUALENV_EXECUTABLE=python3 -DDUNE_PYTHON_VIRTUALENV_SETUP=FALSE -DDUNE_PYTHON_ALLOW_GET_PIP=FALSE"
export OPTS=gcc-relwithdebinfo
source "${INSTALL_PREFIX}/venv/gamm-2019-talk-on-conservative-rb/bin/activate"

