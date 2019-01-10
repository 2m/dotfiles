Use stow to overlay dotfiles from this repository onto your system

For dotfiles in user home directory use:

```sh
stow sbt
```

For system-wide configuration files use:

```sh
sudo stow -t / nss
```
