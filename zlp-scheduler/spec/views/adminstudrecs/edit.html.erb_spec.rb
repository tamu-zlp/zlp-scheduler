require 'rails_helper'

RSpec.describe "adminstudrecs/edit", type: :view do
  before(:each) do
    @adminstudrec = assign(:adminstudrec, Adminstudrec.create!(
      name: "MyString",
      uin: 1,
      email: "MyString",
      classcode: "MyString",
      major: "MyString"
    ))
  end

  it "renders the edit adminstudrec form" do
    render

    assert_select "form[action=?][method=?]", adminstudrec_path(@adminstudrec), "post" do

      assert_select "input#adminstudrec_name[name=?]", "adminstudrec[name]"

      assert_select "input#adminstudrec_uin[name=?]", "adminstudrec[uin]"

      assert_select "input#adminstudrec_email[name=?]", "adminstudrec[email]"

      assert_select "input#adminstudrec_classcode[name=?]", "adminstudrec[classcode]"

      assert_select "input#adminstudrec_major[name=?]", "adminstudrec[major]"
    end
  end
end
