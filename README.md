# TBOT

Hubot-script unittest helper


## Usage

```coffee
tbot = require 'tbot'

describe 'hubot', ->
  tbot = null

  # create new tbot before each test
  beforeEach (done)->
    tbot = new tbot done
    tbot.load './src/hello.coffee'

  # clear tbot after each test
  afterEach ->
    do tbot.clear

  # write your test cases
  describe 'hello', ->
    it 'should send world', ()->
      tbot.send 'hubot hello', (res)->
        assert.equal res, "world"
```

