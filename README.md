# TBOT

Writing your hubot script? Make unit tests with TBOT.

It's easy.


[![npm](https://img.shields.io/npm/v/tbot.svg?style=flat-square)](https://www.npmjs.com/package/tbot)


## Usage

Write your test-cases like

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
$ npm install tbot --save-dev
```

