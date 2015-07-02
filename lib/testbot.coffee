TextMessage = require("hubot/src/message").TextMessage
path = require 'path'

class Testbot
  constructor: () ->
    Robot = require("hubot/src/robot")
    @robot = new Robot null, 'mock-adapter', yes, 'hubot'
    @adapter = @robot.adapter
    @user = @robot.brain.userForId '1', {
      name: 'mocha',
      root: '#mocha'
    }

  load: (src_path, files, done)->
    @robot.adapter.on 'connected', ->
      process.env.HUBOT_AUTH_ADMIN = "1"
      for f in files
        @robot.loadFile path.resolve(src_path), f
      do done
    do @robot.run

  run: (done)->

  send: (msg, cb)->
    @adapter.receive new TextMessage @user, msg
    @adapter.on 'send', (env, str)->
      cb str[0]

  reply: (msg, cb)->
    @adapter.receive new TextMessage @user, msg
    @adapter.on 'reply', (env, str)->
      cb str[0]

  clear: ->
    do @robot.server.close
    do @robot.shutdown

module.exports = Testbot
