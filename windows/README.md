

# install guide

## steps
### scoop install
```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

### install essentials
- docker
    - scoop install docker
    - scoop install docker-compose
- git


### install terminal tools
- auto suggest
```
# 관리자 권한으로 실행
Install-Module -Name PSReadLine -Force
Install-Module -Name PSFzf -Force
```
- starship 
    - scoop install starship
- eza 
    - scoop install eza
- lazydocker
    - scoop bucket add extras
    - scoop install lazydocker
- neovim
    - scoop install neovim
- fzf
    - scoop install fzf
- ripgrep
    - scoop install ripgrep
- delta
    - scoop install delta


### dotfiles.local 생성
- dotfiles.template에서 복사
- dotfiles.collection : 모음
- dotfiles.template : 현재 설정


### link files (대부분 powershell 관리자 권한 실행 필요)
- dotfiles.local 안의 파일은 $HOME에 하위 dir은 .dir로
- wezterm.lua
    - New-Item -ItemType SymbolicLink -Path "$HOME\.wezterm.lua" -Target "$HOME\Workspace\config\dotfiles.local\wezterm.lua"

- powershell
```
# # 프로필 디렉토리 생성
# $profileDir = Split-Path -Parent $PROFILE
# New-Item -Path $profileDir -ItemType Directory -Force

# 프로필 파일에 source 명령 추가
# Set-Content -Path $PROFILE -Value '. "$HOME\Workspace\config\dotfiles.local\powershell_profile.ps1"'
```
- starship.toml
    - New-Item -ItemType SymbolicLink -Path "$HOME/.config/starship.toml" -Target "$HOME/Workspace/config/dotfiles.local/config/starship.toml"

- neovim
    - New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$HOME\Workspace\config\neovim"
    - MinGW, CMake 설치 필요
    - scoop install win32yank
    -> telescope-fzf-native.nvim make 안됨 TODO

    