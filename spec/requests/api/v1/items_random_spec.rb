require "rails_helper"

RSpec.describe "GET /api/v1/items/random" do
  it "returns a random item" do
    first_item  = create(:item, name: "Basketball")
    second_item = create(:item, name: "Baseball")

    get "/api/v1/items/random"

    expect(json_body.count).to eq(1)
  end
end
