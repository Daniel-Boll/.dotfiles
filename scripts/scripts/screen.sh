#!/usr/bin/env bash

function command_exists() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "I require the command $1 but it's not installed. Abort."
    exit 1
  fi
}

for i in grim slurp bemenu jq notify-send wl-copy wlr-randr wf-recorder; do
  command_exists "$i"
done

if [[ $1 == "stop" ]]; then
  pkill wf-recorder
  pkill grim
  exit
fi

MODES=("screenshot" "screenrecord")
case $(printf '%s\n' "${MODES[@]}" | bemenu -i -p "Mode:" -l "2 up") in
"screenrecord")
  TYPES=("area" "output" "fullscreen")
  case $(printf '%s\n' "${TYPES[@]}" | bemenu -i -p "Type:" -l "3 up") in
  "area")
    rm /tmp/lastrecording.mp4
    wf-recorder -g "$(slurp)" -f /tmp/lastrecording.mp4 && echo "file:///tmp/lastrecording.mp4" | wl-copy -t text/uri-list
    notify-send "Recording saved to /tmp/lastrecording.mp4 and copied to clipboard"
    ;;
  "output")
    rm /tmp/lastrecording.mp4
    wf-recorder -o "$(wlr-randr --json | jq '.[].name' | tr -d '"' | bemenu -i -p "Output:" -l "3 up")" -f /tmp/lastrecording.mp4 && echo "file:///tmp/lastrecording.mp4" | wl-copy -t text/uri-list
    notify-send "Recording saved to /tmp/lastrecording.mp4 and copied to clipboard"
    ;;
  "fullscreen")
    rm /tmp/lastrecording.mp4
    wf-recorder -f /tmp/lastrecording.mp4 && echo "file:///tmp/lastrecording.mp4" | wl-copy -t text/uri-list
    notify-send "Recording saved to /tmp/lastrecording.mp4 and copied to clipboard"
    ;;
  esac
  ;;
"screenshot")
  TYPES=("area" "output" "fullscreen")
  case $(printf '%s\n' "${TYPES[@]}" | bemenu -i -p "Type:" -l "3 up") in
  "area")
    grim -g "$(slurp)" - | tee /tmp/lastshot.png | wl-copy -t image/png
    notify-send "screenshot saved to /tmp/lastshot.png and copied to clipboard"
    ;;
  "output")
    grim -o "$(wlr-randr --json | jq '.[].name' | tr -d '"' | bemenu -i -p "Output:" -l "3 up")" - | tee /tmp/lastshot.png | wl-copy -t image/png
    notify-send "screenshot saved to /tmp/lastshot.png and copied to clipboard"
    ;;
  "fullscreen")
    grim - | tee /tmp/lastshot.png | wl-copy -t image/png
    notify-send "screenshot saved to /tmp/lastshot.png and copied to clipboard"
    ;;
  *)
    echo "Invalid option"
    ;;
  esac

  ;;
esac
