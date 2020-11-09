When /^I fill in the add admin form$/ do
    fill_in "user_firstname", with: "John"
    fill_in "user_lastname", with: "Doe"
    fill_in "user_email", with: "blah@tamu.edu"
    fill_in "user_uin", with: "1000"
    click_button("Create")
end

When /^I fill out the new user form/ do
    choose("user_role_admin")
    fill_in "user_uin", with: "1000"
    fill_in "user_firstname", with: "John"
    fill_in "user_lastname", with: "Doe"
    fill_in "user_email", with: "blah@tamu.edu"
    fill_in "user_password", with: "1234"
    fill_in "user_password_confirmation", with: "1234"
    click_button("Sign up")
end

When /^I edit the administrator/ do
    fill_in "user_lastname", with: "Smith"
    click_button("Update")
end