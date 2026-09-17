# dotfiles

Personal config files, synced across devices.

`home/` mirrors `$HOME`: each file's path under `home/` is where it belongs
relative to your home directory (e.g. `home/.config/ghostty/config` ->
`~/.config/ghostty/config`).

## Setup on a new device

```sh
git clone git@github.com:montmejat/dotfiles.git ~/dotfiles
~/dotfiles/setup.sh
```

This symlinks every file under `home/` into place, backing up any existing
file at that path as `<file>.bak` first.

## Adding a new config

```sh
mkdir -p ~/dotfiles/home/.config/<app>
cp ~/.config/<app>/<file> ~/dotfiles/home/.config/<app>/<file>
~/dotfiles/setup.sh   # replaces the copy with a symlink
cd ~/dotfiles && git add -A && git commit -m "Add <app> config" && git push
```
