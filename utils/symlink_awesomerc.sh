#!/bin/bash

machine_local_awesomerc=$(git rev-parse --show-toplevel)"/config/awesome/rc.lua"
user_awesomerc=$HOME"/.config/awesome/rc.lua"

machine_local_autostartrc=$(git rev-parse --show-toplevel)"/config/awesome/autostart.lua"
user_autostartrc=$HOME"/.config/awesome/autostart.lua"

ln -s $machine_local_awesomerc $user_awesomerc
ln -s $machine_local_autostartrc $user_autostartrc
