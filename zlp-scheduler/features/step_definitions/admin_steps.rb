When /^I fill in the add admin form$/ do
    fill_in "user_firstname", with: "John"
    fill_in "user_lastname", with: "Doe"
    fill_in "user_email", with: "blah@tamu.edu"
    fill_in "user_uin", with: "1000"
    click_button("Create")
end

When(/^I fill out the new user form/) do
    find("input[name='user[uin]']").set('1000')
    find("input[name='user[email]']").set('blah@tamu.edu')
    find("input[name='user[password]']").set('1234')
    find("input[name='user[password_confirmation]']").set('1234')
    click_button('Sign up')
end

When(/^I login with the new user account/) do
    fill_in 'Email', with: 'blah@tamu.edu'
    # The default is Temp
    fill_in 'Password', with: 'Temp'
    click_button('Log in')
end

When /^I edit the administrator/ do
    fill_in "user_lastname", with: "Smith"
    click_button("Update")
end

When /^I delete the new admin$/ do
    user = User.find_by(:email => "blah@tamu.edu")
    click_link("Delete", :href => "/admins/#{user.id}")
end