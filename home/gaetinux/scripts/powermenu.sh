#!/usr/bin/env bash

choice=$(printf "Lock\nLogout\nReboot\nShutdown" | fuzzel --dmenu --prompt "Power: ")

case "$choice" in
  "Lock")
    swaylock
    ;;
  "Logout")
    swaymsg exit
    ;;
  "Reboot")
    systemctl reboot
    ;;
  "Shutdown")
    systemctl poweroff
    ;;
esac