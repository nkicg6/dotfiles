#!/usr/bin/env bash

while :
do
  battery_status=$(cat /sys/class/power_supply/BAT1/status)

  if [ "$battery_status" = "Charging" ]; then
    chargestat="($battery_status)"
    else
    chargestat=""
    fi
  echo "$(date +'%Y-%m-%d %a %I:%M') $(cat /sys/class/power_supply/BAT1/capacity)% ${chargestat}" 
  sleep 1
done

