module.exports = ->
  helper = this
  @World = (callback) ->
    world = helper.world = this

    # set the app URL
    world.cucumber = Package['xolvio:cucumber'].cucumber
    world.wdio = Package['xolvio:webdriver'].wdio
    world.mirrorUrl = world.cucumber.mirror.rootUrl

    options =
      desiredCapabilities: browserName: 'PhantomJs'
      port: 4444
      logLevel: 'silent'

    world.wdio.getGhostDriver options, (browser) ->
      world.browser = browser
      browser.call callback
      return

    return

  return
