require 'rails_helper'

RSpec.describe "StudentActions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/student_actions/index"
      expect(response).to have_http_status(:success)
    end
  end

end
