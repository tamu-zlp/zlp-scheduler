Feature: An student can sumbit her/his schedule
  
Background: log in a a registered student
  Given Registered student and Create term and courses
  And I visit the index page
  And I fill in the login form
  And I should be logged in
  And I click add schedule button

@javascript
Scenario: Apply the submitting process
  And I fill in my courses
  And I click save schedule button 
  And I should see added schedule
  And I click the added schedule
  Then I should see added course information

