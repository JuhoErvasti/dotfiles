#!/bin/bash

set -e

export XSECURELOCK_SAVER=saver_mpv
export XSECURELOCK_LIST_VIDEOS_COMMAND="find ~/Pictures/lock_screen/ -type f"

XSECURELOCK_COMPOSITE_OBSCURER=0 xsecurelock
