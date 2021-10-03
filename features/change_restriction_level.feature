Feature: change restriction
  Scenario: change the level of restriction
    Given I am  on the admin page
    When I  set the level with "1"
    When I  click the button "submit"
    Then I  should see Level 1 highlighted