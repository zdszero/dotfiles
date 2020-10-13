#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit


# wait until polybar has been killed
while [[ $(pgrep -x polybar) ]]; do
  sleep 1
done

# Launch bar1 and bar2
polybar example > /dev/null 2>&1 &

echo "Bars launched..."
