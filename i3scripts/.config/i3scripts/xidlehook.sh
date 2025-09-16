#!/bin/bash

set -e

killall xidlehook

~/.cargo/bin/xidlehook --not-when-fullscreen --not-when-audio --timer 180 '~/.config/i3scripts/lock.sh' '' --timer 120 'systemctl suspend' ''
