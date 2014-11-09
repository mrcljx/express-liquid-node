require('coffee-script/register')

express = require('express')
http = require('http')
path = require('path')
liquid = require('express-liquid-node')

app = express()

app.set('port', process.env.PORT ? 3000)
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'liquid')
app.enable('view cache')
app.engine('liquid', liquid(traceError: true))

fruits = ["Orange", "Apple", "Banana"]

app.use (req, res, next) ->
  res.render 'fruits', fruits: fruits, message: "Hello"

PORT = app.get('port')

http.createServer(app).listen PORT, ->
  console.log "Express server listening on port %d", PORT
