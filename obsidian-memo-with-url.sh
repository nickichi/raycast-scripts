#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Append memos with current Chrome tab URL
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🗒️
# @raycast.argument1 { "type": "text", "placeholder": "Memos with current tab URL" }
# @raycast.argument2 { "type": "text", "placeholder": "Tag", "optional": true }

current_time=$(date +"%H:%M")
title="$(osascript -e 'tell application "Google Chrome" to return title of active tab of front window')"
url="$(osascript -e 'tell application "Google Chrome" to return URL of active tab of front window')"
memo=$(if [ -n "$2" ]; then echo "#$2 $1"; else echo "$1"; fi)
data=$(echo "- $current_time [$title]($url) $memo #memoWithURL" | jq -Rr @uri)
open --background "obsidian://advanced-uri?vault=Vault101&daily=true&heading=Memos&mode=append&data=$data&silent"
