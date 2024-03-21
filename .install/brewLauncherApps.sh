if test ! $(which brew); then
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew"
brew update

echo "Installing Apps"
brew install fish

# Network
brew install curl
brew install wget
brew install ctags
brew install netstat
brew install telnet
brew install --cask portx

# Dev
brew install cmake
brew install git
brew install rust
brew install minikube
brew install pyenv
brew install angular-cli
brew install htop
brew install rust-analyzer
brew install --cask fork
brew install --cask cloudflared
brew install docker
brew install --cask arduino
brew install --cask visual-studio-code
brew install --cask mongodb-compass
brew install --cask postman
brew tap git-chglog/git-chglog
brew install git-chglog
brew install btop

# Apps
brew install neovim
brew install tree
brew install neofetch
brew install --cask rectangle
brew install gotop
brew install --cask telegram-desktop
brew install --cask firefox
brew install stats

# IA
brew install --cask fig

# zip
brew install pigz
