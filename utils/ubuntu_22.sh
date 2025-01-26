#!/bin/bash
set -e

##########################################################################################
## ZSH AND PLUGINS
##########################################################################################
echo "Starting ZSH installation setup..."

# Install zsh and dependencies
echo "Installing ZSH and dependencies..."
sudo apt update
sudo apt install -y zsh curl git

# Install Zsh plugins
echo "Installing Zsh plugins..."
sudo apt install -y zsh-autosuggestions zsh-syntax-highlighting

# Get the script's directory path
CURRENT_DIR=$(pwd)

# Change default shell to zsh
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Changing default shell to ZSH..."
    chsh -s $(which zsh)
    echo "Default shell changed to ZSH. Please log out and log back in for changes to take effect."
fi

##########################################################################################
## DOTFILES CONFIGURATION
##########################################################################################
# zshrc
echo "Creating symbolic link for zshrc..."
SOURCE="$CURRENT_DIR/dotfiles/zshrc"
TARGET="$HOME/.zshrc"
if [ -f "$SOURCE" ]; then
   rm -f "$TARGET"
   ln -sf "$SOURCE" "$TARGET"
   echo "Loading new ZSH configuration..."
   ZDOTDIR=$HOME zsh -c "source $HOME/.zshrc" || true
   if [ "$SHELL" != "/usr/bin/zsh" ]; then
       echo "Changing default shell to ZSH..."
       chsh -s $(which zsh)
       echo "Default shell changed to ZSH. Please log out and log back in for changes to take effect."
   fi
else
   echo "Skipping zshrc: file not found: $SOURCE"
fi

# bashrc
echo "Creating symbolic link for bashrc..."
SOURCE="$CURRENT_DIR/dotfiles/bashrc"
TARGET="$HOME/.bashrc"
if [ -f "$SOURCE" ]; then
   rm -f "$TARGET"
   ln -sf "$SOURCE" "$TARGET"
else
   echo "Skipping bashrc: file not found: $SOURCE"
fi

# gdbinit
echo "Creating symbolic link for gdbinit..."
SOURCE="$CURRENT_DIR/dotfiles/gdbinit"
TARGET="$HOME/.gdbinit"
if [ -f "$SOURCE" ]; then
   rm -f "$TARGET"
   ln -sf "$SOURCE" "$TARGET"
else
   echo "Skipping gdbinit: file not found: $SOURCE"
fi

# gitconfig
echo "Creating symbolic link for gitconfig..."
SOURCE="$CURRENT_DIR/dotfiles/gitconfig"
TARGET="$HOME/.gitconfig"
if [ -f "$SOURCE" ]; then
   rm -f "$TARGET"
   ln -sf "$SOURCE" "$TARGET"
else
   echo "Skipping gitconfig: file not found: $SOURCE"
fi

# vimrc
echo "Creating symbolic link for vimrc..."
SOURCE="$CURRENT_DIR/dotfiles/vimrc"
TARGET="$HOME/.vimrc"
if [ -f "$SOURCE" ]; then
   rm -f "$TARGET"
   ln -sf "$SOURCE" "$TARGET"
else
   echo "Skipping vimrc: file not found: $SOURCE"
fi

# wezterm
echo "Creating symbolic link for wezterm..."
SOURCE="$CURRENT_DIR/wezterm.lua"
TARGET="$HOME/.config/wezterm/wezterm.lua"
if [ -f "$SOURCE" ]; then
   mkdir -p "$(dirname "$TARGET")"
   rm -f "$TARGET"
   ln -sf "$SOURCE" "$TARGET"
else
   echo "Skipping wezterm: file not found: $SOURCE"
fi

# starship
if [ -f "$CURRENT_DIR/dotfiles/starship.toml" ]; then
   curl -sS https://starship.rs/install.sh | sh

   echo "Creating symbolic link for starship..."
   SOURCE="$CURRENT_DIR/dotfiles/starship.toml"
   TARGET="$HOME/.config/starship.toml"
   mkdir -p "$(dirname "$TARGET")"
   rm -f "$TARGET"
   ln -sf "$SOURCE" "$TARGET"
else
   echo "Skipping starship: file not found: $CURRENT_DIR/dotfiles/starship.toml"
fi

# tmux
if [ -f "$CURRENT_DIR/dotfiles/tmux.conf" ]; then
    sudo apt install tmux

    echo "Creating symbolic link for tmux..."
    SOURCE="$CURRENT_DIR/dotfiles/tmux.conf"
    TARGET="$HOME/.tmux.conf"

    rm -f "$TARGET"
    ln -sf "$SOURCE" "$TARGET"
    echo "tmux configuration has been set up successfully"
else
    echo "Skipping tmux: file not found: $CURRENT_DIR/dotfiles/tmux.conf"
fi

##########################################################################################
## NEOVIM
##########################################################################################
echo "Starting Neovim installation and configuration..."

# Check and remove existing nvim installations
echo "Checking for existing Neovim installations..."
if command -v nvim >/dev/null 2>&1; then
   echo "Removing existing Neovim installation..."
   sudo apt remove -y neovim neovim-runtime
   rm -f ~/.local/bin/nvim
fi

# Install required dependencies
echo "Installing required dependencies..."
sudo add-apt-repository -y universe
sudo apt install -y libfuse2

# Create directories
echo "Creating directories..."
mkdir -p ~/.local/bin
mkdir -p ~/.config

# Download and install neovim appimage
echo "Downloading Neovim AppImage..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage ~/.local/bin/nvim

# Config directory paths
SOURCE="$CURRENT_DIR/neovim"
TARGET="$HOME/.config/nvim"

# Check if source config directory exists
if [ -d "$SOURCE" ]; then
   echo "Setting up Neovim configuration..."
   # Remove existing config if it exists
   if [ -d "$TARGET" ] || [ -L "$TARGET" ]; then
       echo "Removing existing Neovim configuration..."
       rm -rf "$TARGET"
   fi
   
   echo "Creating symbolic link for Neovim configuration..."
   ln -s "$SOURCE" "$TARGET"
   
   echo "Neovim installation and configuration completed!"
else
   echo "Skipping Neovim configuration: directory not found: $SOURCE"
   echo "Neovim installation completed (without configuration)!"
fi

##########################################################################################
## CLI TOOLS
##########################################################################################
echo "Starting CLI tools installation..."

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install basic dependencies
echo "Installing dependencies..."
sudo apt update
sudo apt install -y \
    curl \
    wget \
    git \
    build-essential

# Install ripgrep
if ! command_exists rg; then
    echo "Installing ripgrep..."
    sudo apt install -y ripgrep
fi

# Install fzf
if ! command_exists fzf; then
    echo "Installing fzf..."
    sudo apt install -y fzf
fi

# Install bat
if ! command_exists bat; then
    echo "Installing bat..."
    sudo apt install -y bat
    # Ubuntu's bat package is called 'batcat', create symlink to 'bat'
    mkdir -p ~/.local/bin
    ln -sf /usr/bin/batcat ~/.local/bin/bat
fi

# Install duf
if ! command_exists duf; then
    echo "Installing duf..."
    sudo apt install -y duf
fi

# Install eza (formerly exa)
if ! command_exists eza; then
    echo "Installing eza..."
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg
    sudo apt update
    sudo apt install -y eza
fi

# Install zoxide
if ! command_exists zoxide; then
    echo "Installing zoxide..."
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    # Add zoxide to PATH for current session
    export PATH="${HOME}/.local/bin:${PATH}"
    # Initialize zoxide for current session
    eval "$(zoxide init bash)"
fi

# Install lazydocker
if ! command_exists lazydocker; then
    echo "Installing lazydocker..."
    LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazydocker.tar.gz lazydocker
    sudo install lazydocker /usr/local/bin
    rm -f lazydocker.tar.gz lazydocker
fi

# Install lazygit
if ! command_exists lazygit; then
    echo "Installing lazygit..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm -f lazygit.tar.gz lazygit
fi

# Install git-delta
if ! command_exists delta; then
    echo "Installing git-delta..."
    sudo apt install -y delta
fi

##########################################################################################
## FINAL MESSAGE
##########################################################################################
echo "Installation complete! The following has been set up:"
echo "1. ZSH with Powerlevel10k theme"
echo "2. ZSH plugins (autosuggestions, syntax-highlighting)"
echo "3. Neovim with configuration"
echo "4. CLI tools:"
echo "   - ripgrep (rg)"
echo "   - fzf"
echo "   - bat"
echo "   - duf"
echo "   - eza"
echo "   - zoxide"
echo "   - lazydocker"
echo "   - lazygit"
echo "   - git-delta"
