TextMessage = require("hubot/src/message").TextMessage
assert = require 'assert'

class Testbot
  constructor: (done, name = 'hubot', @username = 'mocha', @userroot = '#mocha') ->
    Robot = require("hubot/src/robot")
    @user = null
    @robot = new Robot null, 'mock-adapter', yes, name
    @adapter = @robot.adapter
    @user = @robot.brain.userForId '1', {
      name: @username,
      root: @userroot
    }
    @robot.adapter.on 'connected', ->
      process.env.HUBOT_AUTH_ADMIN = "1"
      do done
    do @robot.run

  load: (file)->
    @robot.loadFile file

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
