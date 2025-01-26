#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${BLUE}Starting setup...${NC}"

echo -e "${BLUE}Installing tools...${NC}"
bash "$SCRIPT_DIR/install_tools.sh"

# zshrc link
if [ -f ~/.zshrc ]; then
    echo -e "${BLUE}Removing up existing .zshrc...${NC}"
    rm ~/.zshrc
fi

echo -e "${BLUE}Creating symlink for .zshrc...${NC}"
ln -sf "$SCRIPT_DIR/dotfiles/zshrc" ~/.zshrc

# neovim link
echo -e "${BLUE}Setting up Neovim configuration...${NC}"

if [ -d ~/.config/nvim ]; then
    echo -e "${BLUE}Removing up existing Neovim configuration...${NC}"
    rm -rf ~/.config/nvim
fi

mkdir -p ~/.config

echo -e "${BLUE}Creating symlink for Neovim configuration...${NC}"
ln -sf "$SCRIPT_DIR/neovim" ~/.config/nvim

# End
echo -e "${GREEN}Setup completed successfully!${NC}"
echo -e "${BLUE}Please restart your terminal or run 'source ~/.zshrc' to apply changes.${NC}"