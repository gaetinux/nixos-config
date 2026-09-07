#!/usr/bin/env bash

choice=$(printf "Lock\nReboot\nShutdown" | fuzzel --dmenu --prompt "Power: ")

case "$choice" in
  "Lock")
    swaylock
    ;;

  "Reboot")
    systemctl reboot
    ;;

  "Shutdown")
    systemctl poweroff
    ;;
esac