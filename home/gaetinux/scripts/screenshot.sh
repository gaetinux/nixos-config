#!/usr/bin/env bash

set -euo pipefail

screenshots_dir="$(xdg-user-dir PICTURES)/Screenshots"
mkdir -p "$screenshots_dir"

filename="$(date +%Y-%m-%d_%H-%M-%S_%N).png"
output="$screenshots_dir/$filename"

if [[ "${1:-}" == "--area" ]]; then
  geometry="$(slurp)"
  grim -g "$geometry" "$output"
else
  grim "$output"
fi

wl-copy < "$output"
