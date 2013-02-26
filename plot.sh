#!/bin/bash
gnuplot << eor
 set terminal png
 set output 'results.png'
 set datafile separator ","
 set xlabel "Seconds"
 set ylabel "Memory (bytes)"
 plot 'websockets-and-uploads.csv' using 1 title "Uploads and WebSockets" with lines lw 3, \
      'just-uploads.csv' using 1 title "No WebSockets" with lines lw 3, \
	  'just-websockets.csv' using 1 title "No uploads" with lines lw 3
eor
