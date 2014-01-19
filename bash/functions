#! /usr/bin/env bash

function where(){
	gfind . -iname "*$1*"
}

function purl { curl -b cookies -c cookies "$@" | prettyjson | less -R; }
function cm() { git commit -am "$*"; }
function lastfiletime(){
	echo "$(ll -tr | tail -1 | awk '{print $8;}') vs $(date | awk '{print $4;}')"
}
function killp() { 
	local d=$(lsof -i :"$1" | tail -1)
	local p
	local n
	
	if [[ -z "$d" ]]; then
		echo "Nothing running on $1."
		return 666;
	fi

	read n p _ < <(echo "$d");
	read -p "Kill $n($p)? " -n 1 -r
	
	echo "";

	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		echo "not killed.";
		return 666;
	else 
		kill "$p";
		echo "killed.";
	fi
}
