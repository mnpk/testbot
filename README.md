# TESTBOT

Writing your hubot script?

Make unit tests with `TESTBOT`.

It's easy.

[![npm](https://img.shields.io/npm/v/testbot.svg?style=flat-square)](https://www.npmjs.com/package/testbot)

![hubot](http://i.imgur.com/KSlQyEg.png)

## Usage

Write your test-cases like

```coffee
Testbot = require 'testbot'
assert = require 'assert'

describe 'hubot', ->
  bot = null

  # create new bot before each test
  beforeEach (done)->
    bot = new Testbot
    bot.load './src', ['hello.coffee'], done

  # clear bot after each test
  afterEach ->
    do bot.clear

  # write your test cases
  describe 'hello', ->
    it 'should send world', (done)->
      bot.send 'hubot hello', (res)->
        assert.equal res, "world"
        do done
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

