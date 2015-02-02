assert = require('assert')

module.exports = ->
  helper = @

  @Given /^I am an anonymous user$/, (callback) ->
    callback()
    return

  @When /^I navigate to the home page$/, (callback) ->
    helper.world.browser
      .url(helper.world.mirrorUrl)
      .call(callback)
    return

  @Then /^I see a jumbotron explaining the app and links to "([^"]*)" and "([^"]*)"$/, (signUpPath, signInPath, callback) ->
    helper.world.browser.getText '.jumbotron', (error, jumbotron) ->
      assert jumbotron.length

    helper.world.browser.getAttribute 'a.btn-primary', 'href', (error, attr)->
      assert _.endsWith attr, signUpPath

    helper.world.browser.getAttribute 'a.btn-default', 'href', (error, attr)->
      assert _.endsWith attr, signInPath
      callback()

    return

  @Given /^I am an anonymous user$/, (callback) ->
    callback()
    return

  @When /^I navigate to the home page$/, (callback) ->
    helper.world.browser
      .url(helper.world.mirrorUrl)
      .call(callback)
    return

  @When /^I click the sign-up link$/, (callback) ->
    helper.world.browser
      .click('a.btn-primary')
      .call(callback)
    return

  @Then /^I'm redirected to the "([^"]*)" page$/, (path, callback) ->
    helper.world.browser.url (error, urlResult) ->
      assert.equal _.endsWith(urlResult.value, path), true, "Should have been redirected to the #{path} page"
      callback()
    return

  @Given /^I am an anonymous user$/, (callback) ->
    callback()
    return

  @When /^I navigate to the home page$/, (callback) ->
    helper.world.browser
      .url(helper.world.mirrorUrl)
      .call(callback)
    return

  @When /^I click the sign-in link$/, (callback) ->
    helper.world.browser
      .click('a.btn-default')
      .call(callback)
    return

  @Then /^I'm redirected to the "([^"]*)" page$/, (path, callback) ->
    helper.world.browser.url (error, urlResult) ->
      assert.equal _.endsWith(urlResult.value, path), true, "Should have been redirected to the #{path} page"
      callback()
    return
