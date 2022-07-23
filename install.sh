# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
  nixpkgs.coreutils \
	nixpkgs.zsh \
	nixpkgs.git \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.gnumake \
	nixpkgs.gcc \
  nixpkgs.go \
	nixpkgs.direnv \
  nixpkgs.nerdfonts \
    awscli \
    awsebcli \
    google-cloud-sdk

# stow dotfiles
stow nix
stow git
stow nvim
stow tmux
stow zsh
stow p10k

nix registry add flake:neovim-nightly github:nix-community/neovim-nightly-overlay
nix profile install "neovim-nightly#neovim"

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins 
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install-neovim-from-release)

# Use kitty terminal on MacOS
[ `uname -s` = 'Darwin' ] && stow kitty
