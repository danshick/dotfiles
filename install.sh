#!/usr/bin/env sh

ROOT_DIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)";

# create potentially missing directories
mkdir -p "${HOME}/.bin";
mkdir -p "${HOME}/.config/"{alacritty,tmux};
mkdir -p "${HOME}/.gnupg";
mkdir -p "${HOME}/.ssh";


# install asdf
git clone -q https://github.com/asdf-vm/asdf.git ${HOME}/.asdf --branch v0.12.0;

# symlink config files
ln -sf "${ROOT_DIR}/alacritty/alacritty.yml" "${HOME}/.config/alacritty/alacritty.yml";
ln -sf "${ROOT_DIR}/git/gitignore" "${HOME}/.gitignore";
ln -sf "${ROOT_DIR}/sqlite/sqliterc" "${HOME}/.sqliterc";
ln -sf "${ROOT_DIR}/starship/starship.toml" "${HOME}/.config/starship.toml";
ln -sf "${ROOT_DIR}/tmux/tmux.conf" "${HOME}/.config/tmux/tmux.conf";

# symlink config directories
ln -sfn "${ROOT_DIR}/nvim" "${HOME}/.config/nvim";

# configure git
sh ${ROOT_DIR}/git/gitconfig.sh;
