require "rails_helper"

RSpec.describe "GET /api/v1/merchants/random" do
  it "returns a random merchant" do
    first_merchant  = create(:merchant, name: "Wally Worldd")
    second_merchant = create(:merchant, name: "Target")

    get "/api/v1/merchants/random"

    expect(json_body.count).to eq(1)
  end
end
