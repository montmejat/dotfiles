#!/usr/bin/env bash
# Symlinks every file under home/ into the matching path under $HOME,
# backing up anything already there (once) as <file>.bak.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
src_root="$repo_dir/home"

find "$src_root" -type f | while read -r src; do
  rel="${src#"$src_root"/}"
  dest="$HOME/$rel"

  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    continue
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "Backing up existing $dest -> $dest.bak"
    mv "$dest" "$dest.bak"
  fi

  ln -s "$src" "$dest"
  echo "Linked $dest -> $src"
done
