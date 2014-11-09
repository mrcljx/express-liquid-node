# express-liquid-node

## Installation

```
npm install express-liquid-node --save
```

## Usage

```
app.set('view engine', 'liquid')
app.engine('liquid', liquid(traceError: true))

app.get '/', (req, res) ->
  res.render 'awesome-view', localVariable: "foobar" 
```

## License

express-liquid-node is released under the [MIT license](http://www.opensource.org/licenses/MIT).
