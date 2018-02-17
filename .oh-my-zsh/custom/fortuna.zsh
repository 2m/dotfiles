if [[ $(basename -s .zsh $0) == $(hostname) ]] ; then
  alias 'pacaur=env XDG_CACHE_HOME=/data/cache pacaur'
fi
