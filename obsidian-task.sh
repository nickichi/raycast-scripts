#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Add task
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ✅
# @raycast.argument1 { "type": "dropdown", "placeholder": "Type", "data":[{"title": "#work", "value": "#work"}, {"title": "#private", "value": "#private"}]}
# @raycast.argument2 { "type": "text", "placeholder": "Task text" }
# @raycast.argument3 { "type": "text", "placeholder": "Due Date" }

date=$(gdate -d $3 +%Y-%m-%d)
echo $date
dataencoded=$(echo "- [ ] #task $1 $2 📅 $date" | jq -Rr @uri)
open --background "obsidian://advanced-uri?vault=Vault101&filename=tasks&heading=TaskMaster&mode=prepend&data=${dataencoded}"
