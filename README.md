# express-liquid-node

*express-liquid-node* is an [Express 4.x engine](http://expressjs.com/api.html#app.engine) to use Liquid templates. The rendering engine is [*liquid-node*](http://github.com/sirlantis/liquid-node).

## Installation

```
npm install express-liquid-node --save
```

## Usage

```
app.engine('liquid', require('express-liquid-node')());
app.set('view engine', 'liquid');

app.get('/', function (req, res) {
  res.render('awesome-view', localVariable: 'foobar');
});
```

## License

express-liquid-node is released under the [MIT license](http://www.opensource.org/licenses/MIT).
