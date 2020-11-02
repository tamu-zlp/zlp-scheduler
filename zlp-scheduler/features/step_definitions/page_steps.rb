Then(/^I should see the (.+) page$/) do |page_name|
  if page_name == 'closed'
    expect(current_path).to eq "/student/closed"
  elsif page_name == 'terms'
    expect(current_path).to eq "/student/view_terms"
  elsif page_name == 'new term'
    expect(current_path).to eq "/admin/new_term"
  elsif page_name == 'admin terms'
    expect(current_path).to eq "/admin/view_term_admin"
  elsif page_name == 'open semester'
    expect(current_path).to eq "/admin/open_semester"
  else
    fail("not valid page name")
  end
end

When /I click the logo/ do
  click_link("Tamu zlp logo", match: :first)
end