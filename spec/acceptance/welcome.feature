Feature: Welcoming Visitors to our site
  In order to provide a nice welcome and central place for organization
  Visitors are directed to the welcome page

  Scenario: The Home Page is the Welcome Page
    When I visit "/"
    Then I should be on the home page
    And I should see an overview of the High Holidays
