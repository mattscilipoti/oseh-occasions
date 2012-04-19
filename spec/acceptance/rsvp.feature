Feature: Who will be attending?
  In order to provide enough food, services, and manage budget
  The Organizers
  Want to know who will be attending

  Background:
    Given these Events:
      | Name          | SubEvents  |
      | Yom Kippur    |            |
      | High Holidays | Yom Kippur |


  Scenario: Only Logged in Users can RSVP
    When I visit the "Yom Kippur" event page
    Then I should see "Please sign in in order to RSVP"
    And  I should not be asked about attendance

  Scenario: Can not sign up for events composed of other events
    Given I login successfully
    When I visit the "High Holidays" event page
    Then I should not be asked about attendance

  @event @person
  Scenario: Identifying which Family Members will attend
  As a household member,
  It should be easy to indicate which of your family members are attending

    Given these Households:
      | Family Name    | Heads of Household                      | Dependents                                  | Main Phone |
      | Fletcher/Flynn | Linda Flynn-Fletcher, Lawrence Fletcher | Candace Flynn, Phineas Flynn, Ferb Fletcher | 555-1234   |
      | Brown/Fox      | Dan Fox, Ronnie Brown                   | Toni Goldberg                               | 555-4567   |

    And I am "Linda Flynn-Fletcher"

    When I visit the "Yom Kippur" event page
    And I indicate that "Linda, Candace, & Ferb" will be attending

    When I visit the "Yom Kippur" event page
    Then I should see that 3 people are attending
    Then I should see that 3 people are attending from your household
    Then I should see these People:
      | Who        | Attending? |
      | Linda      | Yes        |
      | Lawrence   | No         |
      | Candace    | Yes        |
      | Phineas    | No         |
      | Ferb       | Yes        |
      
    When I am "Dan Fox"
    And I visit the "Yom Kippur" event page
    And I indicate that "Dan, Ronnie" will be attending
    
    When I visit the "Yom Kippur" event page
    Then I should see that 5 people are attending
    Then I should see that 2  people are attending from my household
    Then I should see these People:
      | Who     | Attending? |
      | Dan     | Yes        |
      | Ronnie  | Yes        |
      | Toni    | No         |
      
    When I am "Phineas Flynn"
    And I visit the "Yom Kippur" event page
    Then I should see that 5 people are attending
    Then I should see that 3 people are attending from your household
    
