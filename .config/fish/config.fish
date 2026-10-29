function fish_greeting
    bytefetch
end
fish_add_path -g ~/.local/bin
set -gx EDITOR nvim
set -gx VISUAL nvim

if status is-interactive
    starship init fish | source
    zoxide init fish | source
    fzf --fish | source

    alias ls 'eza --icons --group-directories-first'
    alias ll 'eza -l --icons --git --group-directories-first'
    alias la 'eza -la --icons --git --group-directories-first'
    alias tree 'eza --tree --icons'
    alias cat 'bat --paging=never --style=plain'
    abbr -a y yazi
    abbr -a g git
    abbr -a up paru
    abbr -a e nvim
end
