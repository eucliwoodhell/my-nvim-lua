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
