Feature: Add meeting as teacher

  Scenario: Creating a meeting
    Given I am in teacher dashboard
    When I  input the "start_time" with "9:00"
    When I  input the "end_time" with "10:00"
    When I  input the "meeting_type" with "workshop"
    When I  input the "meeting_location" with "online"
    When I  input the "meeting_description" with "This is an extra workshop session"
    When I  click the button "submit"
    Then I  should see "Add meeting successfully"