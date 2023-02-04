#!/usr/bin/env bash
#
# Copyright (C) 2023 pacmanzou <pacmanzou@qq.com>
#
# Description: set cpu frequency
#

currentGovernor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

if [ "$currentGovernor" = "powersave" ]; then
    cat < "$HOME/personal/manjaro_password.txt" | sudo -S cpupower frequency-set --governor performance
    notify-send 'Cpufreq performance'
else
    cat < "$HOME/personal/manjaro_password.txt" | sudo -S cpupower frequency-set --governor powersave
    notify-send 'Cpufreq powersave'
fi
