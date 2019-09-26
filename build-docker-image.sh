#!/bin/bash
#
# This file is part of the ftschindler-work/gamm-2019-talk-on-conservative-rb project:
#   https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb
# The copyright lies with the authors of this file (see below).
# License: BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)

docker rmi dunecommunity/debian-qtcreator
docker build -t ftschindler-work/gamm-2019-talk-on-conservative-rb -f Dockerfiles/Dockerfile Dockerfiles/
docker push ftschindler-work/gamm-2019-talk-on-conservative-rb

