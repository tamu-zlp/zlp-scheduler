Feature: An Admin can view the result
  As an administrator
  so that I can run the algorithm
  I want to be able to view the result.
  
Background: log in as an admin
  Given the following cohorts exist:
  | Test Cohort  |
  And I am logged in as an admin  
  Then I should see the admin terms page

Scenario: View the view result page
  When I push "Test Cohort"
  Then I should see the Test Cohort page
  And I push "Find Class Time"
  Then I should see the view result page

