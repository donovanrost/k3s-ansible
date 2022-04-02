#!/bin/sh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install ansible
brew install ansible

# Install commandline tools... assumption is that you're on a mac
softwareupdate --all --install --force

# Install SSHPass
# Needed for sshing with a password
brew install hudochenkov/sshpass/sshpass