export PATH="$HOME/.local/bin:$PATH:$HOME/go/bin:$HOME/.npm-global/bin"
export PATH="$PATH:$HOME/.pulumi/bin:$HOME/.krew/bin:$HOME/.opencode/bin"

export ZSH="$HOME/.oh-my-zsh"

plugins=(
    colorize
    emoji
    emotty
    eza
    fzf
    git
    k9s
    kubectl
    kubectx
    ng
    pass
    systemd
    themes
    ufw
    uv
    z
    zsh-autosuggestions
    zsh-interactive-cd  
    zsh-navigation-tools
    zsh-syntax-highlighting
)

# Initialize zsh completion system
autoload -Uz compinit
compinit

# Modern completion settings
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' auto-description 'always'
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=* r:|=*' 'l:|=* r:|=*'

ZSH_THEME="agnoster"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=238'
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=50000
SAVEHIST=50000

source $ZSH/oh-my-zsh.sh

# History configuration
setopt HIST_IGNORE_ALL_DUPS  # Keep only the latest entry if a command is repeated
setopt HIST_SAVE_NO_DUPS     # Don't write duplicates to the history file
setopt HIST_FIND_NO_DUPS     # Don't display duplicates when searching history
setopt HIST_REDUCE_BLANKS    # Remove superfluous whitespace
setopt HIST_IGNORE_SPACE     # Ignore commands starting with a space
setopt HIST_NO_STORE         # Don't save the 'history' command itself

alias cat="bat"

export KEYID=
export KUBECONFIG=

source <(istioctl completion zsh)
source <(pulumi gen-completion zsh)

[ -f '/home/david/google-cloud-sdk/path.zsh.inc' ] && source '/home/david/google-cloud-sdk/path.zsh.inc' || :
[ -f '/home/david/google-cloud-sdk/completion.zsh.inc' ] && source '/home/david/google-cloud-sdk/completion.zsh.inc' || :
[ -n "$EAT_SHELL_INTEGRATION_DIR" ] && source "$EAT_SHELL_INTEGRATION_DIR/zsh" || :
