#!/usr/bin/env bash
set -u

# Poll the laptop battery and send desktop alerts while discharging.
# Alert once per discharge cycle when crossing 90%, 50%, 10%, and hibernate at 5%.

POLL_SECONDS=${BATTERY_MONITOR_POLL_SECONDS:-60}
BATTERY_GLOB=${BATTERY_MONITOR_BATTERY_GLOB:-/sys/class/power_supply/BAT*}
STATE_DIR=${XDG_RUNTIME_DIR:-/tmp}/my-env-battery-monitor
STATE_FILE="$STATE_DIR/state"
LOCK_FILE="$STATE_DIR/lock"

mkdir -p "$STATE_DIR"
exec 9>"$LOCK_FILE"
if ! flock -n 9; then
  exit 0
fi

battery_path() {
  local battery
  for battery in $BATTERY_GLOB; do
    [[ -r "$battery/capacity" && -r "$battery/status" ]] && {
      printf '%s\n' "$battery"
      return 0
    }
  done
  return 1
}

send_notification() {
  local urgency=$1
  local title=$2
  local body=$3
  local expire_ms=${4:-10000}

  if command -v notify-send >/dev/null 2>&1; then
    notify-send --app-name="Battery monitor" --urgency="$urgency" --expire-time="$expire_ms" "$title" "$body"
  fi
}

play_alarm() {
  local sound=${BATTERY_MONITOR_ALARM_SOUND:-/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga}

  if command -v paplay >/dev/null 2>&1 && [[ -r "$sound" ]]; then
    paplay "$sound" &
  elif command -v canberra-gtk-play >/dev/null 2>&1; then
    canberra-gtk-play -i alarm-clock-elapsed -d "Battery low" &
  fi
}

load_state() {
  prev_capacity=""
  notified_90=0
  notified_50=0
  notified_10=0
  hibernated_5=0

  [[ -r "$STATE_FILE" ]] && # shellcheck disable=SC1090
    source "$STATE_FILE"
}

save_state() {
  cat >"$STATE_FILE" <<STATE
prev_capacity=${prev_capacity:-}
notified_90=${notified_90:-0}
notified_50=${notified_50:-0}
notified_10=${notified_10:-0}
hibernated_5=${hibernated_5:-0}
STATE
}

reset_cycle() {
  prev_capacity=""
  notified_90=0
  notified_50=0
  notified_10=0
  hibernated_5=0
  save_state
}

crossed_threshold() {
  local threshold=$1
  [[ -n "$prev_capacity" && "$prev_capacity" -gt "$threshold" && "$capacity" -le "$threshold" ]]
}

while true; do
  battery=$(battery_path || true)
  if [[ -z "${battery:-}" ]]; then
    sleep "$POLL_SECONDS"
    continue
  fi

  capacity=$(<"$battery/capacity")
  status=$(<"$battery/status")

  load_state

  if [[ "$status" != "Discharging" ]]; then
    reset_cycle
    sleep "$POLL_SECONDS"
    continue
  fi

  if [[ -z "$prev_capacity" ]]; then
    prev_capacity=$capacity
  fi

  if crossed_threshold 90 && [[ "$notified_90" != 1 ]]; then
    send_notification normal "Battery at 90%" "Power is unplugged and the battery is discharging." 10000
    notified_90=1
  fi

  if crossed_threshold 50 && [[ "$notified_50" != 1 ]]; then
    send_notification normal "Battery at 50%" "Battery is halfway down. Plug in when convenient." 12000
    notified_50=1
  fi

  if crossed_threshold 10 && [[ "$notified_10" != 1 ]]; then
    send_notification critical "Battery critically low: 10%" "Plug in now. The system will hibernate at 5%." 0
    play_alarm
    notified_10=1
  fi

  if [[ "$capacity" -le 5 && "$hibernated_5" != 1 ]]; then
    send_notification critical "Battery at 5%" "Hibernating now to protect your session." 0
    play_alarm
    hibernated_5=1
    save_state
    systemctl hibernate || send_notification critical "Hibernate failed" "Battery is at ${capacity}%, but systemctl hibernate failed." 0
  fi

  prev_capacity=$capacity
  save_state
  sleep "$POLL_SECONDS"
done
