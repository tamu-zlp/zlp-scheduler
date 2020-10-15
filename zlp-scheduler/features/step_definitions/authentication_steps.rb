Before do
  # The current sessions_controller requires at least one active term
  @term = FactoryBot.create(:term, :active=>true)
  @term.save()
end

Given(/^I am (not )?a registered (student|admin)$/) do |is_not, role|
  if is_not == nil
    @user = FactoryBot.create(:user, :role=>role)
  else
    # Using build will not save record to db, so the user is not registered
    @user = FactoryBot.build(:user, :role=>role)
  end
end

Then (/^I should (not )?be logged in$/) do |is_not|
  if is_not == nil
    expect(page).to have_content("Logged in !")
  else
    expect(page).to have_content("Email or password is invalid")
    expect(current_path).to eq "/"
  end
end

Given("I visit the index page") do
  visit "/"
end

def fill_login_form
  fill_in "Email", :with => @user.email
  fill_in "Password", :with => @user.password
  click_button("Log in")
end

When("I fill in the login form") do
  fill_login_form
end

Given("I am logged in") do
  visit "/"
  fill_login_form
end

When("I click on the log out link") do
  click_link("Log out", match: :first)
end

Then("I should be redirected to the login page") do
  expect(current_path).to eq "/login"
end

Then(/^I am (not )?in the active cohort$/) do |is_not|
  if is_not != nil
    @term.opendate = Date.current.tomorrow
    @term.closedate = Date.current.tomorrow
    @term.save
  end
end