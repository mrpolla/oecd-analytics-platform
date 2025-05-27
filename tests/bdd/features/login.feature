Feature: User Authentication
  As a user of the OECD Analytics Platform
  I want to be able to login with my credentials
  So that I can access the dashboard

  Background:
    Given the OECD Analytics Platform is running
    And I am on the login page

  Scenario: Successful login with valid credentials
    Given I have valid credentials
    When I enter "bundesdruckerei" as username
    And I enter "demo123" as password
    And I click the login button
    Then I should be redirected to the dashboard
    And I should see "Productivity Analysis" on the page

  Scenario: Failed login with invalid username
    Given I have invalid credentials
    When I enter "wrong_user" as username
    And I enter "demo123" as password
    And I click the login button
    Then I should see an error message
    And I should remain on the login page

  Scenario: Failed login with invalid password
    Given I have invalid credentials
    When I enter "bundesdruckerei" as username
    And I enter "wrong_password" as password
    And I click the login button
    Then I should see an error message
    And I should remain on the login page

  Scenario: Empty credentials
    When I click the login button without entering credentials
    Then I should see validation errors
    And I should remain on the login page