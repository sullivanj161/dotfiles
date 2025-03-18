#!/bin/bash

# Set path to your dotfiles repository
DOTFILES_DIR="$HOME/dotfiles/homefiles"

# Check if the .bashrc file exists in the home directory
if [ -f "$HOME/.bashrc" ]; then
    # Backup the existing .bashrc file
    mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
    echo "Backup of .bashrc created as .bashrc.bak"
fi

# Create a symbolic link to the .bashrc from the dotfiles repository
ln -s "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"

# Prompt the user to reload their environment
echo "Installation complete. The .bashrc file has been updated."
echo "Please run the following to reload your environment:"
echo "source ~/.bashrc"
echo "Alternatively, log out and log back in to apply the changes."
