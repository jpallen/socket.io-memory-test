client = require "socket.io-client"
request = require "request"
fs = require "fs"

argv = require("optimist")
	.options "s"
		alias: "websockets"
		describe: "Client connects to server with websockets"
		default: true
	.options "u"
		alias: "uploads"
		describe: "Client sends large POST requests to server"
		default: true
	.argv

if argv["websockets"]
	console.log "Connecting via websockets"
	setInterval (
		() ->
			client.connect("https://localhost:5000", "force new connection" : true)
	), 1000

if argv["uploads"]
	console.log "Sending uploads"
	setInterval (
		() ->
			fs.createReadStream("image.png").pipe(request.post("https://localhost:5000/upload"))
	), 100
