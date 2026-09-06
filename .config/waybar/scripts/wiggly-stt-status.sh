#!/bin/bash
# Waybar module for local dictation status

STATE_DIR="/tmp/wiggly-hypr"
PID_FILE="$STATE_DIR/recording.pid"

if [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
    echo '{"text": "", "alt": "recording", "tooltip": "Recording... (Ctrl+Space to finish, Escape to cancel)", "class": "recording"}'
else
    echo '{"text": "", "alt": "idle", "tooltip": "Dictation ready (Ctrl+Space)", "class": "idle"}'
fi
