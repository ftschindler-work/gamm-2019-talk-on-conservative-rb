#!/bin/bash
#
# This file is part of the ftschindler-work/gamm-2019-talk-on-conservative-rb project:
#   https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb
# The copyright lies with the authors of this file (see below).
# License: BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)

export NOTEBOOK_PATH=$PWD/notebooks
export NOTEBOOK_PORT=${EXPOSED_PORT:-18881}

jupyter-notebook --ip 0.0.0.0 --no-browser --notebook-dir=$NOTEBOOK_PATH --port=$NOTEBOOK_PORT

