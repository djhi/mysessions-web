Feature: Home Page

  As a user
  I want to see what this site is about
  So that I can create an account or sign in

    Scenario: Anonymous users should see the presentation
      Given I am an anonymous user
      When I navigate to the home page
      Then I see a jumbotron explaining the app and links to "/sign-up" and "sign-in"

    Scenario: Anonymous users can sign-up
      Given I am an anonymous user
      When I navigate to the home page
      And I click the sign-up link
      Then I'm redirected to the "/sign-up" page

    Scenario: Anonymous users can sign-in
      Given I am an anonymous user
      When I navigate to the home page
      And I click the sign-in link
      Then I'm redirected to the "/sign-in" page
