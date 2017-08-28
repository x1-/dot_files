### env
if status --is-login
  . ~/.config/fish/env.fish
end

### alias
if test -e ~/.config/fish/alias.fish
  . ~/.config/fish/alias.fish
end

### specific
if test -e ~/.config/fish/specific.fish
  . ~/.config/fish/specific.fish
end
