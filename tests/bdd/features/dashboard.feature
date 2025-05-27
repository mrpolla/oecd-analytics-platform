Feature: Dashboard Functionality
  As an authenticated user
  I want to view OECD productivity data
  So that I can analyze economic trends

  Background:
    Given I am logged into the platform
    And I am on the dashboard page

  Scenario: View global productivity overview
    When the dashboard loads
    Then I should see a global productivity chart
    And the chart should contain data for multiple countries
    And I should see a country selection dropdown

  Scenario: Compare countries
    Given I can see the country selector
    When I select "Germany" from the country dropdown
    Then the chart should update to show Germany's data
    And I should see "Germany" in the chart title

  Scenario: View industry breakdown
    Given I am viewing country data
    When I select an industry filter
    Then the data should be filtered by that industry
    And the chart should update accordingly

  Scenario: Handle missing data
    Given some countries have incomplete data
    When I select a country with missing data
    Then I should see an appropriate message
    And the chart should handle missing values gracefully