require "rails_helper"

RSpec.describe "GET /api/v1/merchants/find?attr=value" do
  it "returns a merchant" do
    first_merchant  = create(:merchant, name: "Jewel")
    second_merchant = create(:merchant, name: "Osco")
    third_merchant  = create(:merchant, name: "Target")

    get "/api/v1/merchants/find?id=#{second_merchant.id}"

    expect(json_body).to eq({
      "id"         => second_merchant.id,
      "name"       => second_merchant.name,
      "created_at" => format_date(second_merchant.created_at),
      "updated_at" => format_date(second_merchant.updated_at)
    })

    get "/api/v1/merchants/find?name=#{third_merchant.name}"

    expect(json_body).to eq({
      "id"         => third_merchant.id,
      "name"       => third_merchant.name,
      "created_at" => format_date(third_merchant.created_at),
      "updated_at" => format_date(third_merchant.updated_at)
    })
  end
end
