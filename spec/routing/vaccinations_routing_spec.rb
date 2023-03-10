require "rails_helper"

RSpec.describe VaccinationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/campaigns/1/children").to route_to(
        "vaccinations#index",
        campaign_id: "1"
      )
    end
  end
end
