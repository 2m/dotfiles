if [[ $(basename -s .zsh $0) == $(hostname) ]] ; then

  function reboot() {
    case "$1" in
      "fw")
        sudo systemctl reboot --firmware-setup
	;;
      "win")
        sudo efibootmgr -n 0001 && systemctl reboot
	;;
      *)
        systemctl reboot
	;;
    esac
  }

fi
