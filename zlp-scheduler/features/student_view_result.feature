Feature: An student can view the result
  As an student
  so that I can see the result chosen by admin 
  I want to be able to view the result.
  
Background: log in as an student
  Given the following terms exist:
  | name          |
  | Test Term     |
  And the active term is "Test Term"
  And the following cohorts exist:
  | name          |
  | Test Cohort   |
  And "Test Cohort" is in the current term
  
  Scenario: View the selected time slot
    Given Registered
    And the current term is open
    And I am logged in
    And I should see the terms page
    Then I should see time slot selected for Test Cohort 