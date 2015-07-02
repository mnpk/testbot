# TBOT

Hubot-script unittest helper


## Usage

Write your test-cases like

```coffee
testbot = require 'testbot'

describe 'hubot', ->
  testbot = null

  # create new testbot before each test
  beforeEach (done)->
    testbot = new testbot done
    testbot.load './src/hello.coffee'

  # clear testbot after each test
  afterEach ->
    do testbot.clear

  # write your test cases
  describe 'hello', ->
    it 'should send world', ()->
      testbot.send 'hubot hello', (res)->
        assert.equal res, "world"
```

and run with `mocha`

```shell
$ mocha


  hubot
    hello
      ✓ should send world


  1 passing (89ms)
```


## Install

```shell
$ npm install testbot --save-dev
```

