#!/bin/bash

# Start extramuros
if [ $ENABLE_EXTRAMUROS -ne 0 ]; then
    cd extramuros 
    (node server.js --password p -o 57121 -s 57120 & node client.js --server 0.0.0.0 --tidalCabal &) &
fi

# Start supercollider
cd $HOME
sclang
