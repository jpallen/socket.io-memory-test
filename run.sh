#!/bin/bash
coffee --nodejs "--expose-gc" test.coffee --no-uploads | tee "just-websockets.csv"
coffee --nodejs "--expose-gc" test.coffee --no-websockets | tee "just-uploads.csv"
coffee --nodejs "--expose-gc" test.coffee | tee "websockets-and-uploads.csv"
./plot.sh

