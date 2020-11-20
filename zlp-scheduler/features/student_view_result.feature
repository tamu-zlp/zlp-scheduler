Feature: An student can view the result
  As an student
  so that I can see the result chosen by admin 
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
  And I am logged in as an admin


Scenario: View the view result and non-conflict result
  When I click "Admin Test Cohort"
  Then I should see the view cohort page for Admin Test Cohort 
  When I click "Run Algorithm"
  Then I should see the view cohort page for Admin Test Cohort 
  When I click "Find Class Time"
  Then I should see the view result page for Admin Test Cohort
  When I click button "Choose"
  And I click on the log out link
  Then I should be redirected to the login page
  Given I am an active student in Admin Test Cohort
  And I logined as a registered student
  And I should be logged in
  
