#!/bin/bash

install_homebrew() {
        which -s brew
        if [[ $? != 0 ]]; then
                echo "==================================="
                echo "Installing Homebrew"
                echo "==================================="
                ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
}
