#!/bin/bash

## Bash script for setting up a PX4 development environment on Ubuntu LTS (16.04).
## It can be used for installing simulators (only) or for installing the preconditions for Snapdragon Flight or Raspberry Pi.
##
## Installs:
## - Common dependencies and tools for all targets (including: Ninja build system, Qt Creator, pyulog)
## - FastRTPS and FastCDR
## - jMAVSim simulator dependencies
## - PX4/Firmware source (to ~/src/Firmware/)

# Preventing sudo timeout https://serverfault.com/a/833888
# trap "exit" INT TERM; trap "kill 0" EXIT; sudo -v || exit $?; sleep 1; while true; do sleep 60; sudo -nv; done 2>/dev/null &


