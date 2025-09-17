#!/usr/bin/env bash

if ! killall .waybar-wrapped; then
  waybar
fi

