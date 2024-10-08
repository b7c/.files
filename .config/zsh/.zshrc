# plugins
ZVM_VI_EDITOR=nvim
PURE_GIT_PULL=0

zvm_after_init() {
  command -v fzf &>/dev/null && source <(fzf --zsh);
  command -v zoxide &>/dev/null && source <(zoxide init zsh)
}

source ~/.local/share/antidote/antidote.zsh
antidote load ~/.config/zsh/antidote.conf

# aliases
alias ls='ls --color=always'
alias la='ls -lha'
alias l='ls -lh'
if command -v eza &>/dev/null; then
  alias ls='eza --icons=auto'
  alias l='ls -l'
  alias la='ls -la'
  alias lg='ls -l --git --git-repos'
fi
alias diff='diff --color=auto'
alias .files='/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME'
alias open='xdg-open'
alias ff='clear;fastfetch -c neofetch'
alias whoamip='dig -4 +short myip.opendns.com @resolver2.opendns.com'
if command -v zoxide &>/dev/null; then
  alias cd=z
  alias zq='zoxide query'
fi

# path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.local/scripts"

# environment
export EDITOR=nvim
export SYSTEMD_EDITOR=vim
export SUDO_EDITOR=vim
export OLLAMA_MODELS=$HOME/.ollama/models

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

setopt append_history inc_append_history hist_ignore_dups hist_verify extended_history
HISTFILE=$HOME/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
