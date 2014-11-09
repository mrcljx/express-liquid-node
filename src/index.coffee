Liquid = require "liquid-node"
Promise = require "bluebird"
fs = require "fs"
readFile = Promise.promisify fs.readFile, fs

module.exports = (options) ->
  engine = new Liquid.Engine

  (path, options, cb) ->
    readFile(path)
    .then (content) ->
      engine.parse(content)
    .then (template) ->
      template.render(options)
    .nodeify cb
