Feature: API Data Access
  As a system user
  I want the API to provide reliable access to OECD data
  So that the dashboard can display current information

  Background:
    Given the API is running
    And the database contains OECD data

  Scenario: Retrieve country list
    When I request the list of countries
    Then I should receive a valid JSON response
    And the response should contain country codes and names

  Scenario: Get productivity data for a country
    Given I have a valid authentication token
    When I request productivity data for "DEU"
    Then I should receive Germany's productivity data
    And the data should include multiple industries
    And each record should have year and productivity values

  Scenario: Handle invalid country code
    Given I have a valid authentication token
    When I request data for an invalid country code "XXX"
    Then I should receive a 404 error
    And the response should contain an appropriate error message