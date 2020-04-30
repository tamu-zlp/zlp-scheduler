require "rails_helper"

RSpec.describe AdminstudrecsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/adminstudrecs").to route_to("adminstudrecs#index")
    end

    it "routes to #new" do
      expect(get: "/adminstudrecs/new").to route_to("adminstudrecs#new")
    end

    it "routes to #show" do
      expect(get: "/adminstudrecs/1").to route_to("adminstudrecs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/adminstudrecs/1/edit").to route_to("adminstudrecs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/adminstudrecs").to route_to("adminstudrecs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/adminstudrecs/1").to route_to("adminstudrecs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/adminstudrecs/1").to route_to("adminstudrecs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/adminstudrecs/1").to route_to("adminstudrecs#destroy", id: "1")
    end
  end
end
