#!/usr/bin/env bash
# Pushes the chosen theme mode (light|dark|auto) to wezterm and ghostty.
# State lives outside the repo in ~/.local/state/theme/:
#   mode     -> read by wezterm.lua (watched, so wezterm reloads live)
#   ghostty  -> included by ghostty/config via `config-file`; empty = auto
# Ghostty (>= 1.2) reloads its config on SIGUSR2.
set -euo pipefail

mode="${1:-auto}"
case "$mode" in
  light | dark | auto) ;;
  *)
    echo "Usage: theme-apply-terminals.sh light|dark|auto" >&2
    exit 1
    ;;
esac

state_dir="$HOME/.local/state/theme"
mkdir -p "$state_dir"

# Write via temp file + mv so the watchers never see a truncated file.
write_state() {
  printf '%s' "$2" >"$state_dir/$1.tmp"
  mv "$state_dir/$1.tmp" "$state_dir/$1"
}

# ghostty file first, mode last: wezterm's watcher fires on `mode`.
case "$mode" in
  light) write_state ghostty $'theme = onedarkpro_onelight\n' ;;
  dark) write_state ghostty $'theme = Dracula\n' ;;
  auto) write_state ghostty '' ;;
esac
write_state mode "$mode"$'\n'

pkill -USR2 -x ghostty 2>/dev/null || true
