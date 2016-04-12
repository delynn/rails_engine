require "rails_helper"

RSpec.describe "GET /api/v1/merchants/find_all?attr=value" do
  it "returns a list of merchants" do
    first_merchant  = create(:merchant, name: "Wally World")
    second_merchant = create(:merchant, name: "Wally World")
    third_merchant  = create(:merchant, name: "Target")
    four_merchant   = create(:merchant, name: "Target")

    get "/api/v1/merchants/find_all?name=#{first_merchant.name}"

    expect(json_body.count).to eq(2)

    first_merchant_json = json_body[0]
    expect(first_merchant_json).to eq({
      "id"         => first_merchant.id,
      "name"       => first_merchant.name,
      "created_at" => format_date(first_merchant.created_at),
      "updated_at" => format_date(first_merchant.updated_at)
    })
  end
end
