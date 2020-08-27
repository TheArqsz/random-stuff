#!/usr/bin/env sh
# Simple script that turns on or off LED in your keyboard

if [ -z "$1" ]
then
    status="on"
else
  if [ "$1" = "--help" ]
  then
    echo "Help for keyboard led manager"
    echo "Usage:"
    echo "	--help, see this help"
    echo "	on, 	(default) turn led on"
    echo " 	off, 	turn led off"
  fi

  if [ "$1" = "off" ]
  then
    status="off"
  else
    status="on"
  fi 
fi

# Set keyboard led to $status
xset led $status


