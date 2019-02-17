FROM dunecommunity/arch-full-interactive

MAINTAINER Felix Schindler <felix.schindler@wwu.de>

RUN pacman -Syyuu --noconfirm

RUN export USERNAME_=user && \
    export UID_=1000 && \
    export GID_=$UID_ && \
    groupadd -g $GID_ $USERNAME_ && \
    useradd -md /home/$USERNAME_ -g $GID_ -s /bin/bash -u $UID_ $USERNAME_ && \
    chown -R $USERNAME_:$GID_ /home/$USERNAME_ && \
    echo "$USERNAME_ ALL=(ALL) NOPASSWD:/usr/bin/pacman" >> /etc/sudoers

ADD mkimage-*.sh /home/user/
RUN chown -R user:user /home/user

USER user
WORKDIR /home/user
ENV LANG en_US.UTF-8
RUN bash mkimage-01-prepare.sh && \
    bash mkimage-02-build-dune.sh && \
    rm -f /home/user/mkimage-*.sh

USER root
ADD bashrc /home/user/.bashrc
ADD bash_profile /home/user/.bash_profile
RUN chown -R user:user /home/user

# clean up, there might be some leftovers
RUN pacman -Rns --noconfirm $(pacman -Qtdq) || echo "no orphans present" && \
    pacman -Sc --noconfirm

ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

