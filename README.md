Use [`chezmoi`](https://github.com/twpayne/chezmoi) to apply dotfiles from this repository onto your system.

## Installation on a clean system

Install `chezmoi` and `lastpass-cli`:

```sh
yay -S chezmoi              # Arch Linux
brew install chezmoi        # MacOs
```

Clone this repo to the chezmoi data directory:

```sh
git clone git@github.com:2m/dotfiles.git ~/.local/share/chezmoi/
```

Apply home configuration:

```sh
chezmoi -c ~/.local/share/chezmoi/chezmoi-home.toml apply
```

Apply system configuration:

```sh
sudo chezmoi -c ~/.local/share/chezmoi/chezmoi-root.toml apply
```

## gpg setup

https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e
