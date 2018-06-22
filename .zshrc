#export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="robbyrussell"

# emacs key bindings
bindkey -e

# for history tracking
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=10000
setopt appendhistory

# prompt using shrink_path
setopt prompt_subst
PS1='$(shrink_path -f)> '

# right prompt showing last exit code
function last_exit_code() {
  local last=$?
  if [[ $last -ne 0 ]]; then
    echo "$last"
  fi
}
RPROMPT='$(last_exit_code)'

# completions
autoload -U compinit
compinit

# start prompt at the end
tput cup 9999 0

# setup gpg agent for signing commits
export GPG_TTY=$(tty)

# ctrl + arrows
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

precmd() {
  # for tmux-gitbar which hooks to PROMPT_COMMAND
  eval "$PROMPT_COMMAND"
}

source <(antibody init)
antibody bundle < ~/.config/zsh/plugins
