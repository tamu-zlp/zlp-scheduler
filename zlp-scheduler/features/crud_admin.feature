Feature: An admin can create and delete other admins
  As an administrator
  So that only active administrators have access to the application
  I want to be able to add and delete other administrators.
  
Background: log in as an admin
  Given the following terms exist:
  | name            |
  | Test Term       |
  | Extra Test Term |
  | New Test Term   |
  And the active term is "Test Term"
  And I am logged in as an admin
  
Scenario: View the Manage Administrators page
  When I click "Manage Administrators"
  Then I should see the manage administrators page
  
Scenario: Back to Home button
  When I click "Manage Administrators"
  And I click "Back to Home"
  Then I should see the admin terms page
  
Scenario: Add Administrator Cancel Button
  When I click "Manage Administrators"
  And I click "Add Administrator"
  And I click "Cancel"
  Then I should see the manage administrators page

Scenario: Add Administrator
  When I click "Manage Administrators"
  And I click "Add Administrator"
  And I fill in the add admin form
  Then I should see the manage administrators page
  And I should see "blah@tamu.edu</td>"
  
Scenario: Added administrator can claim account
  When I click "Manage Administrators"
  And I click "Add Administrator"
  And I fill in the add admin form
  And I click on the log out link
  And I click "New User?"
  And I fill out the new user form
  Then I should see the admin terms page
  And I should see "Howdy, John!"
  
Scenario: Edit Administrator Cancel Button
  When I click "Manage Administrators"
  And I click "Edit"
  And I click "Cancel"
  Then I should see the manage administrators page
  
Scenario: Edit Administrator
  When I click "Manage Administrators"
  And I click "Edit"
  And I edit the administrator
  Then I should see the manage administrators page
  And I should see "Smith"
  
Scenario: Can't delete only admin
  When I click "Manage Administrators"
  And I click "Delete"
  Then I should see the manage administrators page
  And I should see "There must be at least 1 administrator at all times."
  