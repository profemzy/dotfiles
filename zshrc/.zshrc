eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PGHOST="/var/run/postgresql"

# Load secrets from ~/.secrets (not tracked by git)
# Create this file with: echo 'export AZURE_OPENAI_API_KEY="your-key"' >> ~/.secrets
[[ -f ~/.secrets ]] && source ~/.secrets

export PATH=$PATH:/usr/local/go/bin

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

setopt inc_append_history

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export PATH="$HOME/.local/share/omarchy/bin:$PATH"
eval "$($HOME/.local/bin/mise activate zsh)"

new_tmux () {
  session_dir=$(zoxide query --list | fzf)
  session_name=$(basename "$session_dir")

  if tmux has-session -t $session_name 2>/dev/null; then
    if [ -n "$TMUX" ]; then
      tmux switch-client -t "$session_name"
    else
      tmux attach -t "$session_name"
    fi
    notification="tmux attached to $session_name"
  else
    if [ -n "$TMUX" ]; then
      tmux new-session -d -c "$session_dir" -s "$session_name" && tmux switch-client -t "$session_name"
      notification="new tmux session INSIDE TMUX: $session_name"
    else
      tmux new-session -c "$session_dir" -s "$session_name"
      notification="new tmux session: $session_name"
    fi
  fi

  if [-s "$session_name" ]; then
    notify-send "$notification"
  fi
}

alias tm=new_tmux
alias zed='zeditor'
alias opn='opnsense-cli'
export PATH="$HOME/.local/bin:$PATH"

# Kubernetes and Docker aliases
alias k='kubectl'
alias dc='docker compose'

# kubectl autocomplete
if command -v kubectl &> /dev/null; then
  autoload -Uz compinit
  compinit
  source <(kubectl completion zsh)
fi
