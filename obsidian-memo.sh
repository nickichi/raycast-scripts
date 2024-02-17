#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Append memos
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🗒️
# @raycast.argument1 { "type": "text", "placeholder": "Memos" }
# @raycast.argument2 { "type": "text", "placeholder": "Tag", "optional": true }


current_time=$(date +"%H:%M")
memo=$(if [ -n "$2" ]; then echo "#$2 $1"; else echo "$1"; fi)
memo=$(echo "$memo" | sed 's/ /%20/g' )
open --background "obsidian://advanced-uri?vault=Vault101&daily=true&heading=Memos&mode=append&data=-%20$current_time%20$memo&silent"
