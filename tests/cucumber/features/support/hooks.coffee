module.exports = ->
  helper = this
  @Before ->
    world = helper.world
    callback = arguments[arguments.length - 1]
    world.browser.init().call ->
      _resetUsers callback
    return

  @After ->
    world = helper.world
    callback = arguments[arguments.length - 1]
    world.browser.end().call callback
    return

  _resetUsers = Meteor.bindEnvironment (next) ->
    connection = DDP.connect helper.world.cucumber.mirror.host

    connection.call '/fixtures/resetUsers', (err) ->
      if err
        next.fail "Error in /fixtures/resetUsers DDP call to #{helper.world.cucumber.mirror.host} : #{err}", err
      else
        next()

      connection.disconnect()

  return
