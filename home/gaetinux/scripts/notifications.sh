#!/usr/bin/env bash

set -euo pipefail

state_file="$HOME/.local/state/mako/last-seen-id"
mkdir -p "$(dirname "$state_file")"

history="$(makoctl history -j)"
last_seen="$(cat "$state_file" 2>/dev/null || true)"
last_seen="${last_seen:-0}"

# mako holds its history in memory and numbers notifications from 1 on every
# start, so the ids are monotonic within one run of the daemon and no further.
# A highest id below the recorded mark means the daemon restarted and dropped
# the history that mark referred to, leaving nothing on record as seen.
highest="$(echo "$history" | jq 'map(.id) | max // 0')"
if [ "$highest" -lt "$last_seen" ]; then
  last_seen=0
fi

case "${1:-show}" in
  count)
    echo "$history" | jq --argjson last "$last_seen" '[.[] | select(.id > $last)] | length'
    ;;

  show)
    echo "$history" | jq -r '.[] | (.app_name // "?") + ": " + (.summary | gsub("\n"; " "))' \
      | fuzzel --dmenu --prompt "Notifications: " --width 80 > /dev/null || true
    echo "$highest" > "$state_file"
    ;;
esac
