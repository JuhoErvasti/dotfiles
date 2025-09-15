#!/bin/bash

set -e

~/.cargo/bin/xidlehook --not-when-fullscreen --timer 180 '~/.config/i3scripts/lock.sh' '' --timer 120 'systemctl suspend' ''
