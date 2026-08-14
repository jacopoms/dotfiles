#!/usr/bin/env bash
# Applies the resolved theme mode to the running tmux-powerkit status bar.
mode="$("$HOME/bin/theme-mode" 2>/dev/null || echo dark)"

# tmux-powerkit ships no "onedark" light variant (only src/themes/onedark/dark.sh
# exists), so "github" is used as the closest built-in light theme available.
if [ "$mode" = "light" ]; then
  tmux set -g @powerkit_theme 'github'
  tmux set -g @powerkit_theme_variant 'light'
else
  tmux set -g @powerkit_theme 'dracula'
  tmux set -g @powerkit_theme_variant 'dark'
fi

# If a session is already running, force powerkit to reload live instead of
# waiting for the next session/window creation.
reload="$HOME/.tmux/plugins/tmux-powerkit/src/helpers/reload_theme.sh"
if [ -n "$TMUX" ] && [ -x "$reload" ]; then
  bash "$reload"
fi
