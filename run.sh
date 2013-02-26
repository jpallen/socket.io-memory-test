#!/bin/bash
coffee --nodejs "--expose-gc" server.coffee --no-uploads | tee "just-websockets.csv"
coffee --nodejs "--expose-gc" server.coffee --no-websockets | tee "just-uploads.csv"
coffee --nodejs "--expose-gc" server.coffee | tee "websockets-and-uploads.csv"
./plot.sh

