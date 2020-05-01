require 'rails_helper'

RSpec.describe "adminstudrecs/index", type: :view do
  before(:each) do
    assign(:adminstudrecs, [
      Adminstudrec.create!(
        name: "Name",
        uin: 2,
        email: "Email",
        classcode: "Classcode",
        major: "Major"
      ),
      Adminstudrec.create!(
        name: "Name",
        uin: 2,
        email: "Email",
        classcode: "Classcode",
        major: "Major"
      )
    ])
  end

  it "renders a list of adminstudrecs" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Classcode".to_s, count: 2
    assert_select "tr>td", text: "Major".to_s, count: 2
  end
end
