#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Add Memos To Obsidian
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Take Memos."}

# Documentation:
# @raycast.description It can add your memos to Obsidian memos.

# echo "Hello World!"

current_time=$(date +"%H:%M")
memo=$(echo "$1" | sed 's/ /%20/g')
vault="Local"
# open --background "obsidian://advanced-uri?vault=${vault}&daily=true&mode=append&data=-%20$current_time%20$memo"
open --background "obsidian://advanced-uri?vault=Local&daily=true&mode=append&data=-%20$current_time%20$memo"
