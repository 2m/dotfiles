Use [`chezmoi`](https://github.com/twpayne/chezmoi) to apply dotfiles from this repository onto your system.

For dotfiles in user home directory use:

```sh
chezmoi -c chezmoi-home.toml ...
```

For system-wide configuration files use:

```sh
chezmoi -c chezmoi-root.toml ...
```
