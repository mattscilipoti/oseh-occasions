Feature: Who will be attending?
  In order to provide enough food, services, and manage budget
  The Organizers
  Want to know who will be attending

  Scenario: Identify yourself (unique name)
    As a participant,
    It should be easy to find yourself in the list of People

    Given I am the Person:
      | full_name  | Art M. Green |
      | main_phone | 123-456-7890 |
    When I visit the home page
    And I search by my "full name"
    Then I should see that my information is filled in automatically
