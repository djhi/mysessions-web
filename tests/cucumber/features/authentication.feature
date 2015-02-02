Feature: SignUp Page

  As a user
  I want to create an account or log in
  So that I can use the app

    Scenario: Anonymous users can sign-up
      Given I am an anonymous user on "sign-up" page
      And I complete a sign-up form with "email" and "password" inputs
      Then I'm successfully signed-in and redirected to the "/events" page

    Scenario: Anonymous users can sign-in
      Given I am an anonymous user on "sign-in" page
      And I complete a sign-in form with "email" and "password" inputs with email "test1@test.com" and password "test14"
      Then I'm successfully signed-in and redirected to the "/events" page
