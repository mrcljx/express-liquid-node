Liquid = require "liquid-node"
Promise = require "bluebird"
fs = require "fs"
readFile = Promise.promisify fs.readFile, fs

module.exports = (settings) ->
  engine = new (Liquid.Engine)

  renderFile = (path, options) ->
    readFile(path).then (content) ->
      engine.parseAndRender content, options

  if settings.includes
    engine.registerFileSystem new (Liquid.LocalFileSystem)(settings.includes)
  (path, options, cb) ->
    if options.layout
      renderFile(path, options).then (pageContent) ->
        options.content = pageContent
        options.body = pageContent
        renderFile(options.layout, options).nodeify cb
    else
      (path, options, cb) ->
        renderFile(path, options).nodeify cb

