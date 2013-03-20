# Arbitrary.coffee

choose = (list) ->
  list[Math.floor(Math.random()*list.length)]

arbNull =
  arbitrary: -> null

arbBool =
  arbitrary: -> choose [true, false]

arbNum =
  arbitrary: ->
    num = Math.floor(Math.random()*1000000)
    choose [num, -1 * num]

arbChar =
  arbitrary: -> String.fromCharCode(choose [97..122])

arbString =
  arbitrary: ->
    str = ""
    for i in arbNum.arbitrary
      str = str.concat arbChar.arbitrary
    str

arbArray = (arb) ->
  arbitrary: -> (arb.arbitrary for e in arbNum.arbitrary)

class Arbitrary

  constructor: (@obj) ->

  arbitrary: ->
    