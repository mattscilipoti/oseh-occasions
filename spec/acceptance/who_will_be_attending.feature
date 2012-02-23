Feature: Who will be attending?
  In order to provide enough food, services, and manage budget
  The Organizers
  Want to know who will be attending

  Scenario: Choosing Family Members
  As a participant,
  It should be easy to indicate which of your family members are attending

    Given these households:
      | Surname  | Parents                       | Kids                               | Main Phone | Main Email          |
      | Fletcher | Linda Fynn-Fletcher, Lawrence | Candace Flynn, Phineas Flynn, Ferb | 555-1234   | 104days@example.com |

    And I am "Linda Flynn-Fletcher"

    When I visit the "Yom Kippur" event page
    And I indicate that "Linda, Candace, & Ferb" will be attending
    Then I should see these People:
      | First Name | Attending? |
      | Lynda      | Yes        |
      | Lawrence   | No         |
      | Candace    | Yes        |
      | Phineas    | No         |
      | Ferb       | Yes        |