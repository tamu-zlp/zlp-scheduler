Feature: An Admin can create a new term
  As an administrator
  so that I can run the algorithm
  I want to be able to create a new term.
  
Background: log in as an admin
  Given the following terms exist:
  | name          |
  | Test Term     |
  | New Test Term |
  And the active term is "Test Term"
  And the following cohorts exist:
  | name   |
  | Apple  |
  | Banana |
  And I am logged in as an admin
  
Scenario: View the create new term page
  When I click "New Term"
  Then I should be on the new term page
  
Scenario: Cancel making a new term
  When I click "New Term"
  And I click "Cancel"
  Then I should be on the current term page
  And I should see "Test Term"
  
Scenario: Create a new term
  When I click "New Term"
  And I fill in the new term form
  Then I should be on the current term page
  And I should see "New Test Term"
  And I should see "Apple"
  And I should not see "Banana"
  