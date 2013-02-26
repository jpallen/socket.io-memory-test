socketio = require "socket.io"
https = require "https"
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

options =
	key: fs.readFileSync('server.key')
	cert: fs.readFileSync('server.crt')

server = https.createServer(options).listen(5000)
io = socketio.listen(server, "log level": 0)

server.on "request", (req, res) ->
	req.on "data", (chunk) ->
	req.on "end", () -> res.end()

fs = require "fs"

# Client stuff
if argv["websockets"]
	setInterval (
		() ->
			client.connect("https://localhost:5000", "force new connection" : true)
	), 1000

if argv["uploads"]
	setInterval (
		() ->
			fs.createReadStream("image.png").pipe(request.post("https://localhost:5000/upload"))
	), 250

# Garbage collect regularly for consistency
# Run node with --expose-gc for this to be available
if gc?
	setInterval (
		() -> gc()
	), 1000

# Log memory usage
setInterval (
	() ->
		memory = process.memoryUsage()
		console.log [
			memory.rss
			memory.heapUsed
			memory.heapTotal
		].join(",")
), 1000

# Run for two minutes
setTimeout (() -> process.exit()), 2 * 60 * 1000

