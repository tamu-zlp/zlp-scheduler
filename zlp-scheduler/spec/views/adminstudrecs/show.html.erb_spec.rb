require 'rails_helper'

RSpec.describe "adminstudrecs/show", type: :view do
  before(:each) do
    @adminstudrec = assign(:adminstudrec, Adminstudrec.create!(
      name: "Name",
      uin: 2,
      email: "Email",
      classcode: "Classcode",
      major: "Major"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Classcode/)
    expect(rendered).to match(/Major/)
  end
end
