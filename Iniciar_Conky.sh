#!/bin/bash
 
while true
        do
if ps aux | grep conky | grep -v grep >> /dev/null;
        then
        sleep 20
        else
        sleep 15
        conky
fi
        done
