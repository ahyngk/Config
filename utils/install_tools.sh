GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

check_brew() {
    if ! command -v brew &> /dev/null; then
        echo -e "${BLUE}Installing Homebrew...${NC}"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

install_tool() {
    local tool=$1
    local package=${2:-$tool}
   
    if ! command -v $tool &> /dev/null; then
        echo -e "${BLUE}Installing ${tool}...${NC}"
        brew install $package
        echo -e "${GREEN}${tool} installed successfully!${NC}"
    else
        echo -e "${GREEN}${tool} is already installed${NC}"
    fi
}

install_nvim() {
    echo -e "${BLUE}Setting up Neovim...${NC}"
    
    # neovim 설치
    if ! command -v nvim &> /dev/null; then
        echo -e "${BLUE}Installing Neovim...${NC}"
        brew install neovim
        
        # Neovim 설정 디렉토리 생성
        mkdir -p ~/.config/nvim
        
        echo -e "${GREEN}Neovim installed successfully!${NC}"
    else
        echo -e "${GREEN}Neovim is already installed${NC}"
    fi
}

install_zsh_tools() {
    echo -e "${BLUE}Installing ZSH tools...${NC}"
    # powerlevel10k 테마
    if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
        echo -e "${BLUE}Installing Powerlevel10k...${NC}"
        brew install powerlevel10k
    fi
    # zsh 플러그인들
    echo -e "${BLUE}Installing ZSH plugins...${NC}"
    brew install zsh-autosuggestions zsh-syntax-highlighting
    echo -e "${GREEN}ZSH tools installed successfully!${NC}"
}

install_terminal() {
    echo -e "${BLUE}Setting up Terminal...${NC}"
    
    # neovim 설치
    if ! command -v nvim &> /dev/null; then
        echo -e "${BLUE}Installing Neovim...${NC}"
        brew install neovim
        
        # Neovim 설정 디렉토리 생성
        mkdir -p ~/.config/nvim
        
        echo -e "${GREEN}Neovim installed successfully!${NC}"
    else
        echo -e "${GREEN}Neovim is already installed${NC}"
    fi
}

main() {
    echo -e "${BLUE}Checking and installing required tools...${NC}"
   
    # Homebrew 확인
    check_brew
    
    # 도구들 설치
    install_tool "zoxide"
    install_tool "eza"
    install_tool "duf"
    install_tool "bat"
    install_tool "diff-so-fancy"
    install_tool "fzf"
    install_tool "procs"
    install_tool "rip" "rm-improved"
    install_tool "rg" "ripgrep"
    install_tool "lazydocker"
    install_tool "lazygit"
    install_tool "gdb"
    install_tool "tmux"
    
    # Neovim 설치
    install_nvim
    
    # gdb-dashboard 설치 (gdb가 설치된 경우)
    if command -v gdb &> /dev/null; then
        if [ ! -f ~/.gdbinit ]; then
            echo -e "${BLUE}Installing gdb-dashboard...${NC}"
            wget -P ~ https://git.io/.gdbinit
            echo -e "${GREEN}gdb-dashboard installed successfully!${NC}"
        fi
    fi
   
    # ZSH 도구들 설치
    install_zsh_tools
    
    echo -e "${GREEN}All tools have been installed and configured!${NC}"
    echo -e "${BLUE}Please restart your terminal or run 'source ~/.zshrc' to apply changes.${NC}"
}

main