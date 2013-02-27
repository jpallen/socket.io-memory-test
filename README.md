This is a simple set of scripts for testing the memory usage of Node.js and
socket.io when set up as an HTTPS server serving both WebSockets and large
buffered uploads.

To run you will need coffee script installed:

    npm install -g coffee-script

Then install dependencies:

    npm install

Then run:

    ./run.sh

The tests should take a about 6 minutes, and the result is plotted in
`results.png`
