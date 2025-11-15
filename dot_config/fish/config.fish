if status is-interactive
  starship init fish | source

  # ASDF configuration code
  # ---
  if test -z $ASDF_DATA_DIR
      set _asdf_shims "$HOME/.asdf/shims"
  else
      set _asdf_shims "$ASDF_DATA_DIR/shims"
  end

  # Do not use fish_add_path (added in Fish 3.2) because it
  # potentially changes the order of items in PATH
  if not contains $_asdf_shims $PATH
      set -gx --prepend PATH $_asdf_shims
  end
  set --erase _asdf_shims
  # source (echo $ASDF_DATA_DIR | if test -z $it; echo $HOME/.asdf; else echo $it; end)/plugins/golang/set-env.fish
  # ---

  fzf --fish | source

  set -g fish_key_bindings fish_vi_key_bindings

  # Zoxide needs to be initialised last
  zoxide init fish | source
end

# Created by `pipx` on 2025-09-07 03:49:24
set PATH $PATH /Users/christian/.local/bin

fish_add_path /Users/christian/.spicetify

# pnpm
set -gx PNPM_HOME "/Users/christian/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
