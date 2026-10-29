#!/usr/bin/env bash
set -euo pipefail

src=$(cd "$(dirname "$0")" && pwd)
backup="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

cd "$src"
find .config .local -type f -o -type l | while read -r f; do
    dest="$HOME/$f"
    [[ $(readlink "$dest" 2>/dev/null) == "$src/$f" ]] && continue
    if [[ -e $dest || -L $dest ]]; then
        mkdir -p "$backup/$(dirname "$f")"
        mv "$dest" "$backup/$f"
    fi
    mkdir -p "$(dirname "$dest")"
    ln -s "$src/$f" "$dest"
    echo "linked $f"
done

[[ -d $backup ]] && echo "old files are in $backup"
echo "done, log out and back in"
