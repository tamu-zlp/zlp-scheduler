student = {
  :fisrtName => "MyFirstName",
  :lastName => "MyLastName",
  :password => "MyPassword",
  :email => "testEmail@tamu.edu",
  :uin => 123456789
}

Given(/^I am (not )?a registered student$/) do |is_not|
  if is_not == nil
    @user = User.new
    @user.firstname = student[:fisrtName]
    @user.lastname = student[:lastName]
    @user.uin = student[:uin]
    @user.email = student[:email]
    @user.role = "student"
    @user.password = student[:password]
    @user.save
  end
end

Given("I visit the index page") do
  visit "/"
end

When("I fill in the login form") do
  fill_in "Email", :with => student[:email]
  fill_in "Password", :with => student[:password]
  click_button "Log in"
end

Then (/^I should (not )?be logged in$/) do |is_not|
  if is_not == nil
    expect(page).to have_content("Logged in !")
  else
    expect(page).to have_content("Email or password is invalid")
    expect(current_path).to eq "/"
  end
end

Given("I am logged in") do
  visit "/"
  fill_in "Email", :with => student[:email]
  fill_in "Password", :with => student[:password]
  click_button "Log in"
end

When("I click on the log out link") do
  click_link "Log out"
end

Then("I should be redirected to the login page") do
  expect(current_path).to eq "/login"
end

Then(/^I am (not )?in the active cohort$/) do |is_not|
  @term = Term.find_by active: true
  Term.ImportTermList! unless (@term = Term.find_by active: 1) != nil
  @term = Term.find_by active: true
  if is_not == nil
    @term.opendate = DateTime.new(2001, 2, 3, 4, 5, 6, '+03:00')
    @term.closedate = DateTime.new(2025, 2,3, 4, 5, 6, '+03:00')
    @term.save

    @cohort = Cohort.new
    @cohort.name = "Test Cohort"
    @cohort.term_id = @term.id
    @cohort.save
    @user.cohort_id = @cohort.id
    @user.save
  else
    @term.active = false
  end
end

Then(/^I should see the (.+) page$/) do |page_name|
  if page_name == 'closed'
    expect(current_path).to eq "/student/closed"
  elsif page_name == 'terms'
    expect(current_path).to eq "/student/view_terms"
  end
end