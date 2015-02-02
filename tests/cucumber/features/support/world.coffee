module.exports = ->
  helper = this
  @World = (callback) ->
    world = helper.world = this

    # set the app URL
    world.cucumber = Package['xolvio:cucumber'].cucumber
    world.wdio = Package['xolvio:webdriver'].wdio
    world.mirrorUrl = world.cucumber.mirror.rootUrl

    world.wdio.getGhostDriver (browser) ->
      world.browser = browser
      browser.call callback
      return

    return

  return
