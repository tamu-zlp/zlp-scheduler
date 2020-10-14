Given /the following terms exist/ do |terms_table|
    terms_table.hashes.each do |term|
        Term.create term
    end
end

Given /the following cohorts exist/ do |cohorts_table|
    cohorts_table.hashes.each do |cohort|
        Cohort.create cohort
    end
end

Given /the active term is "(.*)"/ do |term|
    active_term = Term.find_by(:name => term)
    Term.update_all active: false
    active_term.update_attributes!(:active => true)
end

Given /I am logged in as an admin/ do
    @user = FactoryBot.create(:user, :role => "admin")
    visit "/"
    fill_login_form
end

When /I click "(.*)"/ do |action|
    click_link("#{action}", match: :first)
end

When /I fill in the new term form/ do
    select("New Test Term", from: 'Term')
    select("Apple", from: 'cohort_select')
    click_button("Activate")
end

Then /I should (not )?see "(.*)"/ do |is_not, string|
    if is_not
        expect(page.body.match?(/#{string}/m)).to eq false
    else
        expect(page.body.match?(/#{string}/m)).to eq true
    end
end