require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id" do
  it "returns a merchant" do
    first_merchant  = create(:merchant, name: "Kohls")
    second_merchant = create(:merchant, name: "Target")
    third_merchant  = create(:merchant, name: "Wally World")

    get "/api/v1/merchants/#{second_merchant.id}"

    expect(json_body).to eq({
      "id"         => second_merchant.id,
      "name"       => second_merchant.name,
      "created_at" => format_date(second_merchant.created_at),
      "updated_at" => format_date(second_merchant.updated_at)
    })
  end
end
