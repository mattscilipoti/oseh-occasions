Feature: Welcoming Visitors to our site
  In order to provide a nice welcome and central place for organization
  Visitors are directed to the welcome page

  Scenario: Everyone must login
    When I visit "/"
    Then I should be on the login page
    
    When I login successfully
    Then I should be on the home page


  Scenario: The Home Page is the Welcome Page
    Given I am "Dan Ehrenkrantz" 
    When I visit "/"
    Then I should be on the home page
    And I should see "Upcoming Events"
