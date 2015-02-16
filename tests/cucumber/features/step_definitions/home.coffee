assert = require('assert')

module.exports = ->
  helper = @

  @Given /^I am an anonymous user$/, (callback) ->
    callback()
    return

  @When /^I navigate to the home page$/, (callback) ->
    helper.world.browser
      .url(helper.world.mirrorUrl)
      .pause(100)
      .call(callback)
    return

  @Then /^I see the button "([^"]*)" with href "([^"]*)"$/, (btnId, btnPath, callback) ->
    path = "#{helper.world.mirrorUrl}#{btnPath}"

    helper.world.browser.getAttribute "##{btnId}", 'href', (error, attr)->
      assert.equal attr, path, "button #{btnId} should have href equal to #{path} but is #{attr}"
      callback()
    return

  @When /^I click the "([^"]*)" link$/, (btnId, callback) ->
    helper.world.browser
      .click("##{btnId}")
      .pause(100)
      .call(callback)
    return

  @Then /^I'm redirected to the "([^"]*)" page$/, (path, callback) ->
    fullpath = "#{helper.world.mirrorUrl}#{path}"

    helper.world.browser.url (error, urlResult) ->
      assert.equal urlResult.value, fullpath, "Should have been redirected to the #{fullpath} page"
      callback()
    return
