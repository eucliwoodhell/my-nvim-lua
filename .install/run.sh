#!/bin/bash

# COLORS
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
NC=$(tput sgr0)
BOLD=$(tput bold)

declare -r CONFIG_DIR="$HOME/.config/nvim"
declare -r CONFIG_FILE="$CONFIG_DIR/init.vim"
declare -r CONFIG_BACKUP="$HOME/nvim.bak/"
declare -r BRANCH="main"
declare -r REPO_URL="https://github.com/eucliwoodhell/my-nvim-lua.git"

function main () {
  logo

  check_dependencies

  while [ true ]; do
    read -p "Do you want to backup your config? (y/n) " yn
    case $yn in
      [Yy]* )
        echo "${GREEN}${BOLD}Backing up config...${NC}"
        cp -r "$CONFIG_DIR" "$CONFIG_BACKUP"
        echo "${GREEN}${BOLD}Config backed up!${NC}"
        break
        ;;
      [Nn]* )
        echo "${GREEN}${BOLD}Config not backed up!${NC}"
        break
        ;;
      * )
        echo "${RED}${BOLD}Please answer yes or no.${NC}"
        ;;
    esac
  done

  check_os_system

  while [ true ]; do
    read -p "Do you want to continue install? (y/n) " yn
    case $yn in
      [Yy]* )
        if [ -d "$CONFIG_DIR" ]; then
          echo "${GREEN}${BOLD}Removing dir $CONFIG_DIR...${NC}"
          rm -rf "$CONFIG_DIR"
          echo "${GREEN}${BOLD}Dir $CONFIG_DIR removed!${NC}"
        fi
        echo "${GREEN}${BOLD}Cloning repo...${NC}"
        clone_repo
        echo "${GREEN}${BOLD}Repo cloned!${NC}"
        echo "${GREEN}${BOLD}Installing vim plugins...${NC}"
        # TODO install vim plugins
        break
        ;;
      [Nn]* )
        break
        ;;
      * )
        echo "${RED}${BOLD}Please answer yes or no.${NC}"
        ;;
    esac
  done

  msg="${GREEN}${BOLD}Install completed! Thank you, dir config is this $CONFIG_DIR${NC} \
  ${GREEN}${BOLD}You can find your file config in $CONFIG_FILE${NC} \"
  ${GREEN}${BOLD}You can find your backup config in $CONFIG_BACKUP${NC} \"
  ${GREEN}${BOLD}You can find your branch in $BRANCH${NC}"

  echo "$msg"
}

function install_ios() {
  which -s brew
  if [[ $? != 0 ]]; then
    while [ true ]; do
      read -p "Do you want to install Homebrew? (y/n) " yn
      case $yn in
        [Yy]* )
          echo "${GREEN}${BOLD}Installing Homebrew...${NC}"
          ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
          echo "${GREEN}${BOLD}Homebrew installed!${NC}"
          break
          ;;
        [Nn]* )
          echo "${GREEN}${BOLD}Homebrew not installed!${NC}"
          break
          ;;
        * )
          echo "${RED}${BOLD}Please answer yes or no.${NC}"
          ;;
      esac
    done
  fi

  if [[ -f "/usr/local/bin/brew" ]]; then
    echo "${GREEN}${BOLD}Homebrew already installed!${NC}"
    while [ true ]; do
      read -p "Do you want to install nvim? (y/n) " yn
      case $yn in
        [Yy]* )
          echo "${GREEN}${BOLD}Installing nvim...${NC}"
          brew install nvim
          echo "${GREEN}${BOLD}nvim installed!${NC}"
          echo "${GREEN}${BOLD}Installing dependencies...${NC}"
          brew install ripgrep
          echo "${GREEN}${BOLD}Dependencies installed!${NC}"
          break
          ;;
        [Nn]* )
          echo "${GREEN}${BOLD}nvim not installed!${NC}"
          break
          ;;
        * )
          echo "${RED}${BOLD}Please answer yes or no.${NC}"
          ;;
      esac
    done
  else
    echo "${GREEN}${BOLD}Homebrew not installed!${NC}"
    exit 1
  fi
}

function check_os_system() {
  echo "${GREEN}${BOLD}Checking system...${NC}"
  os=$(uname -s)
  case "$os" in 
    Darwin)
      echo "${GREEN}${BOLD}System is MacOS brew install${NC}"
      install_ios
      ;;
    Linux)
      if [ -f "/etc/arch-release" || -f "/etc/artix-release" ]; then
        echo "${GREEN}${BOLD}System is Arch Linux: sudo pacman -S ${NC}"
        echo "${GREEN}${BOLD}Installing nvim ${NC}"
        sudo pacman -S nvim
      elif [ -f "/etc/fedora-release" || [-f "/etc/redhat-release"]]; then
        echo "${GREEN}${BOLD}System is Fedora: sudo dnf install -y ${NC}"
        echo "${GREEN}${BOLD}Installing nvim ${NC}"
        sudo dnf install -y nvim
      elif [ -f "/etc/gentoo-release" ]; then
        echo "${GREEN}${BOLD}System is Gentoo: sudo emerge -y ${NC}"
        echo "${GREEN}${BOLD}Installing nvim ${NC}"
        sudo emerge -y nvim
      else
        echo "${GREEN}${BOLD}System is Linux: sudo apt install -y ${NC}"
        echo "${GREEN}${BOLD}Installing nvim ${NC}"
        sudo apt install -y nvim
      fi
      ;;
    FreeBSD)
      echo "${GREEN}${BOLD}System is FreeBSD${NC}"
      ;;
    OpenBSD)
      echo "${GREEN}${BOLD}System is OpenBSD${NC}"
      ;;
    *)
      echo "${RED}${BOLD}System is not supported${NC}"
      exit 1
      ;;
  esac
  echo -e "${BOLD}${GREEN}${NC}${BOLD}Done...${NC}"
}

function check_dependencies() {
  echo "${GREEN}${BOLD}Checking dependencies...${NC}"
  if ! command -v git >/dev/null 2>&1; then
    echo "${RED}${BOLD}git is not installed${NC}"
    exit 1
  fi
  if ! command -v curl >/dev/null 2>&1; then
    echo "${RED}${BOLD}curl is not installed${NC}"
    exit 1
  fi
  if ! command -v nvim >/dev/null 2>&1; then
    echo "${RED}${BOLD}nvim is not installed${NC}"
    exit 1
  fi
  if ! command -v npm >/dev/null 2>&1; then
    echo "${RED}${BOLD}npm is not installed${NC}"
    exit 1
  fi
}

function clone_repo() {
  echo "${GREEN}${BOLD}Cloning repo...${NC}"
  if ! git clone --branch "$BRANCH" --depth 1 "$REPO_URL" "$CONFIG_DIR"; then
    echo "${RED}${BOLD}Failed to clone repo${NC}"
    exit 1
  fi
  echo "${GREEN}${BOLD}Repo cloned!${NC}"
  cd $CONFIG_DIR
  echo "${GREEN}${BOLD}Backing up config...${NC}"
  echo "${GREEN}${BOLD}Done!...${NC}"
}

function logo () {
  echo "${BLUE}"
  echo "==============================================="
  cat <<'EOF'

 █████╗ ██████╗  ██████╗██╗  ██╗███████╗██████╗ 
██╔══██╗██╔══██╗██╔════╝██║  ██║██╔════╝██╔══██╗
███████║██████╔╝██║     ███████║█████╗  ██████╔╝
██╔══██║██╔══██╗██║     ██╔══██║██╔══╝  ██╔══██╗
██║  ██║██║  ██║╚██████╗██║  ██║███████╗██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

EOF
  echo "==============================================="
  echo "${NC}"
}

main
