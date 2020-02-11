#!/bin/sh

touch=$(xinput | grep 'Touchpad' | awk '{print $6}' | cut -d '=' -f 2-)
tap=$(xinput list-props $touch | grep 'Tapping Enabled (' | awk -F "[()]" '{print $2}')

xinput set-prop $touch $tap 1
