#!/bin/bash
#
# This file is part of the ftschindler-work/gamm-2019-talk-on-conservative-rb project:
#   https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb
# The copyright lies with the authors of this file (see below).
# License: BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)

export LANG=en_US.UTF-8
echo "127.0.0.1 ${HOSTNAME}" >> /etc/hosts

if [ "X$@" == "X" ]; then
  exec gosu $USERNAME_ /bin/bash
else
  exec gosu $USERNAME_ "$@"
fi
