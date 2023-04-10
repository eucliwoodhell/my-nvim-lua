#!/bin/bash

# COLORS
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
NC=$(tput sgr0)
BOLD=$(tput bold)

function main () {
  logo

  check_os_system
  detect_platform

  while [ true ]; do
    read -p "Do you want to backup your config? (y/n) " yn
    case $yn in
      [Yy]* )
        echo "${GREEN}${BOLD}Backing up config...${NC}"
        cp -r ~/.config/nvim ~/.config/nvim.bak/
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
}

function install_homebrew() {
        which -s brew
        if [[ $? != 0 ]]; then
                echo "==================================="
                echo "Installing Homebrew"
                echo "==================================="
                ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
}

function check_os_system() {
  echo "${GREEN}${BOLD}Checking system...${NC}"
  os=$(uname -s)
  case "$os" in 
    Darwin)
      echo "${GREEN}${BOLD}System is MacOS brew install${NC}"
      ;;
    Linux)
      if [ -f "/etc/arch-release" || -f "/etc/artix-release" ]; then
        echo "${GREEN}${BOLD}System is Arch Linux: sudo pacman -S ${NC}"
      elif [ -f "/etc/fedora-release" || [-f "/etc/redhat-release"]]; then
        echo "${GREEN}${BOLD}System is Fedora: sudo dnf install -y ${NC}"
      elif [ -f "/etc/gentoo-release" ]; then
        echo "${GREEN}${BOLD}System is Gentoo: sudo emerge -y ${NC}"
      else
        echo "${GREEN}${BOLD}System is Linux: sudo apt install -y ${NC}"
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
