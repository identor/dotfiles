FROM archlinux/base

WORKDIR /app
ADD pacman/ pacman/.

RUN pacman -Sy && ./pacman/install.sh
RUN chsh -s /bin/zsh

COPY zsh/ zsh/.
COPY vim/ vim/.

