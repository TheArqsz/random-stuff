#!/usr/bin/env bash
# Simple script that detects whether user is connected to VPN via tun0 interface and sets proper prompt for shell
# Additionaly it can be run as `ip_prompt wlan0` and show wlan0 data instead
# Script must be put inside of ~/.bashrc or imported there `. ip_prompt.sh` to work

function ip_prompt {
	int=tun0
	if [ ! -z "$1" ]; then
    		int=$1
	fi
	addr=`ifconfig $int 2>/dev/null | awk '/inet / {print $2}'`
	OLD_PS1=$PS1
	if [ "$addr" == '' ]; then
        	return
	fi
	PS1="\r ▷ Interface: \e[92m${int}\033[0m Ш IP: \e[92m${addr}\033[0m ⬎\n\
		\r↳ \033[01;31m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]> "
}

