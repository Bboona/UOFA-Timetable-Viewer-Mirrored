Feature: Log out as admin

  Scenario: Creating a admin
    Given I am  on the admin page
    When I  click the button "log out"
    Then I  should in root page