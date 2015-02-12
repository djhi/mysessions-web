Feature: Home Page

  As a user
  I want to see what this site is about
  So that I can create an account or sign in

    Scenario: Anonymous users should be able to login or signup
      Given I am an anonymous user
      When I navigate to the home page
      Then I see the button "btnSignUp" with href "sign-up"
      And I see the button "btnSignIn" with href "sign-in"

    Scenario: Anonymous users can sign-up
      Given I am an anonymous user
      When I navigate to the home page
      And I click the "btnSignUp" link
      Then I'm redirected to the "sign-up" page

    Scenario: Anonymous users can sign-in
      Given I am an anonymous user
      When I navigate to the home page
      And I click the "btnSignIn" link
      Then I'm redirected to the "sign-in" page
