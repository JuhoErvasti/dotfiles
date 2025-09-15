#!/bin/bash

set -e

~/.cargo/bin/xidlehook --not-when-fullscreen --timer 180 'xsecurelock' '' --timer 300 'systemctl suspend' ''
