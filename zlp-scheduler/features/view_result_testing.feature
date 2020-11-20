Feature: An Admin can view the result
  As an administrator
  so that I can run the algorithm
  I want to be able to view the result.
  

Background: log in as an admin
  Given the following terms exist:
  | name          |
  | Test Term     |
  And the active term is "Test Term"
  And the following cohorts exist:
  | name                |
  | Admin Test Cohort   |
  And "Admin Test Cohort" is in the current term
  And Student is created
  And The schedule is added
  And I am logged in as an admin

Scenario: View the view result and non-conflict result
  When I click "Admin Test Cohort"
  Then I should see the view cohort page for Admin Test Cohort 
  When I click "Run Algorithm"
  Then I should see the view cohort page for Admin Test Cohort 
  When I click "Find Class Time"
  Then I should see the view result page for Admin Test Cohort
  When I click button "Choose"
  And I go to view cohort page for Admin Test Cohort
  Then I should see the view cohort page for Admin Test Cohort 
  Then I should see time slot selected for Admin Test Cohort 
  
Scenario: View the view result and non-conflict result
  When I click "Admin Test Cohort"
  And I click "Run Algorithm"
  And I click "Find Class Time"
  And I click button "Details"
  Then I should see the view conflicts page for Admin Test Cohort
  And I click "Back"
  Then I should see the view result page for Admin Test Cohort
  

Scenario: student view the result
  When I click "Admin Test Cohort"
  And I click "Run Algorithm"
  And I click "Find Class Time"
  And I click button "Choose"
  And I click on the log out link
  And The term and cohort is opening
  And I login back as a student
  Then I should see time slot selected for Admin Test Cohort
