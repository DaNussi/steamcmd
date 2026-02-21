FROM archlinux/archlinux:latest


RUN printf "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf \
    && pacman -Syu --needed --noconfirm  \
    git  \
    base-devel  \
    lib32-sdl2-compat  \
    lib32-dbus  \
    lib32-gcc-libs  \
    glibc

ARG user=ark
RUN groupadd -g 1000 $user \
  && useradd --system --create-home $user -u 1000 -g 1000 -s /bin/bash \
  && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
USER $user
WORKDIR /home/$user

RUN git clone https://aur.archlinux.org/steamcmd.git \
    && cd steamcmd \
    && makepkg -si --needed --noconfirm \
    && cd ~ \
    && rm -rf .cache steamcmd \
    && sudo pacman -Rn --noconfirm base-devel \
    && steamcmd +quit

CMD ["/usr/bin/steamcmd"]