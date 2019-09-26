#!/bin/bash
#
# This file is part of the ftschindler-work/gamm-2019-talk-on-conservative-rb project:
#   https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb
# The copyright lies with the authors of this file (see below).
# License: BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)

CID_FILE=/tmp/ftschindler-work-gamm-2019-talk-on-conservative-rb.cid

sudo docker exec -it $(cat ${CID_FILE}) gosu $USER /bin/bash

