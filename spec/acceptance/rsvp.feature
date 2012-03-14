Feature: Who will be attending?
  In order to provide enough food, services, and manage budget
  The Organizers
  Want to know who will be attending

  Background:
    Given these Events:
      | Name       |
      | Yom Kippur |


  Scenario: Only Logged in Users can RSVP
    When I visit the "Yom Kippur" event page
    Then I should see "Please sign in in order to RSVP"

  @event @person
  Scenario: Identifying which Family Members will attend
  As a household member,
  It should be easy to indicate which of your family members are attending

    Given these Households:
      | Family Name    | Heads of Household                      | Dependents                                  | Main Phone |
      | Fletcher/Flynn | Linda Flynn-Fletcher, Lawrence Fletcher | Candace Flynn, Phineas Flynn, Ferb Fletcher | 555-1234   |

    And I am "Linda Flynn-Fletcher"

    When I visit the "Yom Kippur" event page
    And I indicate that "Linda, Candace, & Ferb" will be attending

    When I visit the "Yom Kippur" event page
    Then I should see these People:
      | Who        | Attending? |
      | Linda      | Yes        |
      | Lawrence   | No         |
      | Candace    | Yes        |
      | Phineas    | No         |
      | Ferb       | Yes        |
