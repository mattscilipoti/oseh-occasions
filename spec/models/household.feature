Feature: Household
  In order to make it easier for household members to manage participation
  The system should know they are associated

  Scenario: Creating a household
    Given these Households:
      | Family Name    | Heads Of Household                      | Dependents                                  | Main Phone |
      | Balboa         | Rocky, Adrian                           |                                             | 555-YOOO   |
      | Fletcher/Flynn | Linda Flynn-Fletcher, Lawrence Fletcher | Candace Flynn, Phineas Flynn, Ferb Fletcher | 555-1234   |

    Then these Households should exist:
      | Family Name    | Heads Of Household                      | Dependents                                  | Main Phone |
      | Balboa         | Rocky Balboa, Adrian Balboa             |                                             | 555-YOOO   |
      | Fletcher/Flynn | Linda Flynn-Fletcher, Lawrence Fletcher | Candace Flynn, Phineas Flynn, Ferb Fletcher | 555-1234   |

    Then these People should have these Households:
      | Person               | Head? | Household                                                                            |
      | Rocky Balboa         | Yes   | Adrian Balboa, Rocky Balboa                                                          |
      | Adrian Balboa        | Yes   | Adrian Balboa, Rocky Balboa                                                          |
      | Lawrence Fletcher    | Yes   | Lawrence Flecther, Linda Flynn-Fletcher, Candace Flynn, Phineas Flynn, Ferb Flecther |
      | Linda Flynn-Fletcher | Yes   | Lawrence Flecther, Linda Flynn-Fletcher, Candace Flynn, Phineas Flynn, Ferb Flecther |
      | Candace Flynn        | No    | Lawrence Flecther, Linda Flynn-Fletcher, Candace Flynn, Phineas Flynn, Ferb Flecther |
      | Phineas Flynn        | No    | Lawrence Flecther, Linda Flynn-Fletcher, Candace Flynn, Phineas Flynn, Ferb Flecther |
      | Ferb Fletcher        | No    | Lawrence Flecther, Linda Flynn-Fletcher, Candace Flynn, Phineas Flynn, Ferb Flecther |
