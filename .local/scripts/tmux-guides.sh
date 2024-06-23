#!/usr/bin/env bash

declare -A hashtable

while IFS='|' read -r key value; do
	hashtable[$key]=$value
done <~/.tmux-cht-guides

IFS=$'\n'
selected=$(for key in ${!hashtable[@]}; do echo "$key"; done | fzf)
IFS=

if [[ -z $selected ]]; then
	exit 0
fi

url=${hashtable[$selected]}
tmux neww bash -c "echo \"curl $url\" & w3m $url"
