# This file is part of the ftschindler-work/gamm-2019-talk-on-conservative-rb project:
#   https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb
# The copyright lies with the authors of this file (see below).
# License: BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)

FROM dunecommunity/debian-qtcreator

MAINTAINER Felix Schindler <felix.schindler@wwu.de>

RUN mkdir -p /data/home
ENV USERNAME_ user
ENV UID_ 1000
ENV GID_ 1000
RUN groupadd -g $GID_ $USERNAME_ && \
    useradd -d /data/home -g $GID_ -s /bin/bash -u $UID_ $USERNAME_ && \
    echo "$USERNAME_ ALL=(ALL) NOPASSWD:/usr/bin/apt-get" >> /etc/sudoers && \
    echo "$USERNAME_ ALL=(ALL) NOPASSWD:/usr/bin/apt" >> /etc/sudoers && \
    echo "$USERNAME_ ALL=(ALL) NOPASSWD:/usr/bin/dpkg" >> /etc/sudoers

ENV LANG en_US.UTF-8
WORKDIR /data/home
RUN git clone https://github.com/ftschindler-work/gamm-2019-talk-on-conservative-rb.git && \
    cd gamm-2019-talk-on-conservative-rb && \
    git submodule update --init --recursive

RUN mkdir -p /data/dune
ADD setup.sh /data/dune/
ADD PATH.sh /data/dune/
WORKDIR /data/dune
RUN ./setup.sh
ADD strip.sh /data/dune/
RUN ./strip.sh

ADD home.tgz /data/home/
ADD bashrc /data/home/.bashrc
ADD rebuild-dune.sh /data/dune/
RUN chown -R ${USERNAME_}:${USERNAME_} /data

ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

