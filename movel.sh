#!/bin/bash

# Thu Oct 11 00:41:30 CST 2012 
# sunus's script to move the current active window to 
# the LEFT monitor.

wmctrl -v -R :ACTIVE:
wmctrl -v -r :ACTIVE: -b remove,fullscreen
wmctrl -v -r :ACTIVE: -b remove,maximized_vert,maximized_horz
wmctrl -v -r :ACTIVE: -e 0,0,0,640,480
wmctrl -v -r :ACTIVE: -e 0,0,0,-1,-1
wmctrl -v -r :ACTIVE: -b toggle,fullscreen
