Feature: Log in as student

  Scenario: Creating a student
    Given I am  on the root page
    When I  input the "User_name" with "xiangyu"
    When I  input the "Password" with "11111"
    When I  click the button "submit"
    Then I  should see "Student Dashboard"