#!/bin/bash
#
# This file is part of the ftschindler-work/gamm-2019-talk-on-conservative-rb project:
#   https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb
# The copyright lies with the authors of this file (see below).
# License: BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)

cd /data/dune/build
for ii in $(find . -name \*.a -o -name \*.so); do
        strip -g --strip-unneeded -p $ii
done
