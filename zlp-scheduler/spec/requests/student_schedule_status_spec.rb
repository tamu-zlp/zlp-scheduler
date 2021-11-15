require 'rails_helper'

RSpec.describe "StudentScheduleStatuses", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/student_schedule_status/index"
      expect(response).to have_http_status(:success)
    end
  end

end
