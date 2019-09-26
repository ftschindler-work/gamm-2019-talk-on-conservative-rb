#!/bin/bash
#
# This file is part of the ftschindler-work/gamm-2019-talk-on-conservative-rb project:
#   https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb
# The copyright lies with the authors of this file (see below).
# License: BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)

if (( "$#" < 1 )); then
  echo ""
  echo "usage: ${0} PROJECT_DIR"
  echo ""
  exit 1
fi

BASEDIR=${PWD}
CONTAINER=ftschindlerwork/gamm-2019-talk-on-conservative-rb
PROJECT=${1}
CID_FILE=/tmp/ftschindler-work-gamm-2019-talk-on-conservative-rb.cid
PORT="18$(( ( RANDOM % 10 ) ))$(( ( RANDOM % 10 ) ))$(( ( RANDOM % 10 ) ))"

if [ -e ${CID_FILE} ]; then

  echo "A docker container for"
  echo "  ${PROJECT}"
  echo "is already running. Execute the following command to connect to it"
  echo "(docker_exec.sh is provided alongside this file):"
  echo "  ./docker_exec.sh ${PROJECT}"
  echo ""
  echo "If you are absolutely certain that there is no running container (check with 'sudo docker ps -a' and stop it otherwise)"
  echo "you may 'sudo rm $CID_FILE' and try again."

else

  echo "Starting a docker container"
  echo "  for ${PROJECT}"
  echo "  based on ${CONTAINER}"
  echo "  on port $PORT"

  sudo docker run --rm=true --privileged=true -t -i --hostname docker --cidfile=${CID_FILE} \
    -e LOCAL_USER=$USER -e LOCAL_UID=$(id -u) -e LOCAL_GID=$(id -g) \
    -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e QT_X11_NO_MITSHM=1 \
    -e QT_SCALE_FACTOR=${QT_SCALE_FACTOR:-1} \
    -e GDK_DPI_SCALE=${GDK_DPI_SCALE:-1} \
    -e EXPOSED_PORT=$PORT -p $PORT:$PORT \
    -v /etc/localtime:/etc/localtime:ro \
    -v ${BASEDIR}/${PROJECT}:/data/home/${PROJECT} \
    ${CONTAINER} /bin/bash

  sudo rm -f ${CID_FILE}

fi
