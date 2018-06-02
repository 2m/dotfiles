export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git sudo zsh-navigation-tools fast-syntax-highlighting jabba)

source $ZSH/oh-my-zsh.sh

source ~/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
