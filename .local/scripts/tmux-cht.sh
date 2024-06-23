#!/usr/bin/env bash
selected=$(cat ~/.tmux-cht-languages ~/.tmux-cht-command | fzf)
if [[ -z $selected ]]; then
	exit 0
fi

read -p "Enter Query: " query

# for powershell check Get-Help
if [[ "$selected" == "powershell" ]]; then
	query=$(echo $query | tr ' ' '+')
	tmux neww bash -c "pwsh -c 'Get-Help $query' | less"
	exit 0
fi

# cht.sht
if grep -qs "$selected" ~/.tmux-cht-languages; then
	query=$(echo $query | tr ' ' '+')
	tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query | less"
else
	tmux neww bash -c "echo \"curl cht.sh/$selected~$query/\" & curl -s cht.sh/$selected~$query | less"
fi
