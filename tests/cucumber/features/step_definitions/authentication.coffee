assert = require('assert')

module.exports = ->
  helper = @

  @Given /^I am an anonymous user on "([^"]*)" page$/, (path, callback) ->
    helper.world.browser
      .url(helper.world.mirrorUrl + path)
      .pause(100)
      .call(callback)
    return

  @When /^I complete a sign-up form with "([^"]*)" and "([^"]*)" inputs$/, (emailType, passwordType, callback) ->
    browser = helper.world.browser
    browser.setValue "input[type='#{emailType}']", "test@test.com"
    browser.setValue "input[type='#{passwordType}']:first-of-type", "test14"
    browser.setValue "input[type='#{passwordType}']:last-of-type", "test14"
    browser.submitForm "form"
    browser.pause 500, callback
    return

  @When /^I complete a sign-in form with "([^"]*)" and "([^"]*)" inputs with email "([^"]*)" and password "([^"]*)"$/, (emailType, passwordType, email, password, callback) ->
    browser = helper.world.browser
    browser.setValue "input[type='#{emailType}']", email
    browser.setValue "input[type='#{passwordType}']:first-of-type", password
    browser.submitForm "form"
    browser.pause 500, callback
    return

  @Then /^I'm successfully signed-in and redirected to the "([^"]*)" page$/, (path, callback) ->
    helper.world.browser.url (error, urlResult) ->
      assert.equal _.endsWith(urlResult.value, path), true, "Should have been redirected to the #{path} page"
      callback()
