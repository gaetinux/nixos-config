#!/usr/bin/env bash

set -euo pipefail

state_file="$HOME/.local/state/mako/last-seen-id"
mkdir -p "$(dirname "$state_file")"

history="$(makoctl history -j)"
last_seen="$(cat "$state_file" 2>/dev/null || true)"
last_seen="${last_seen:-0}"

case "${1:-show}" in
  count)
    echo "$history" | jq --argjson last "$last_seen" '[.[] | select(.id > $last)] | length'
    ;;

  show)
    echo "$history" | jq -r '.[] | (.app_name // "?") + ": " + (.summary | gsub("\n"; " "))' \
      | fuzzel --dmenu --prompt "Notifications: " --width 80 > /dev/null || true
    echo "$history" | jq 'map(.id) | max // 0' > "$state_file"
    ;;
esac
