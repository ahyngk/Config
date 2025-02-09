
$env:WORKSPACE = "$HOME\Workspace"
$env:CONFIG_PATH = "$env:WORKSPACE\config"
$env:DOTFILES = "$env:CONFIG_PATH\dotfiles.local"

function global:tohome { Set-Location $HOME }
function global:towork { Set-Location $env:WORKSPACE }
function global:toconfig { Set-Location $env:CONFIG_PATH }
function global:todot { Set-Location $env:DOTFILES }

Set-Alias -Name cl -Value Clear-Host -Scope Global

if (Get-Command eza -ErrorAction SilentlyContinue) {
    function global:l { eza --color=auto }
    function global:ll { eza -l --color=auto --icons --git }
    function global:lll { eza -la --color=auto --icons --git }
    function global:lt2 { eza --tree --level=2 --color=auto --icons }
    function global:lt3 { eza --tree --level=3 --color=auto --icons }
} else {
    Write-Warning "eza is not installed. Using default ls commands."
    Set-Alias -Name ls -Value Get-ChildItem -Scope Global
    Set-Alias -Name ll -Value Get-ChildItem -Scope Global
}

function global:reshell { 
    . $PROFILE -Global
    Write-Host "PowerShell profile has been reloaded!" -ForegroundColor Green 
}

# Git aliases
function g { git $args }
function gs { git status }
function ga { git add $args }
function gc { git commit $args }
function gp { git push $args }
function gl { git pull $args }

# Navigation aliases
function .. { Set-Location .. }
function ... { Set-Location ..\.. }
function ~ { Set-Location $HOME }
function ws { Set-Location "$HOME\Workspace" }

# Utility functions
function touch($file) {
    if ($file) { New-Item -ItemType File -Path $file }
}

# Change prompt
function prompt {
    $currentPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    $shortPath = $currentPath.Replace($HOME, "~")
    "PS $shortPath> "
}

# PSReadLine 설정
Import-Module PSReadLine

# 기본 키 바인딩 설정
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# 히스토리 검색 키 바인딩
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# 자동 완성 설정
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key Shift+Tab -Function MenuComplete

# 히스토리 설정
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -MaximumHistoryCount 1000

# 컬러 설정
Set-PSReadLineOption -Colors @{
    Command            = 'Magenta'
    Parameter         = 'DarkGray'
    Operator          = 'DarkGray'
    Variable          = 'Green'
    String            = 'DarkCyan'
    Number            = 'DarkGreen'
    Member            = 'DarkGreen'
    Type              = 'DarkYellow'
    Comment           = 'DarkGray'
    InlinePrediction  = 'DarkGray'
}

Invoke-Expression (&starship init powershell)