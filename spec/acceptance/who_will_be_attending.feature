Feature: Who will be attending?
  In order to provide enough food, services, and manage budget
  The Organizers
  Want to know who will be attending

  Scenario: Identify yourself (unique name)
    As a participant,
    It should be easy to find yourself in the list of Members

    Given I am the Member "Art Green"
    And a bunch of other Members exit
    When I visit the home page
    And I search for my name
    Then I should see that my information is filled in automatically
