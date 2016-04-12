require "rails_helper"

RSpec.describe "GET /api/v1/items" do
  it "returns a list of items" do
    first_item  = create(:item, name: "Headphones")
    second_item = create(:item, name: "Socks")
    third_item  = create(:item, name: "Yeezy Boost 350")

    get "/api/v1/items"

    expect(json_body.count).to eq(3)

    first_item_json = json_body[0]
    expect(first_item_json).to eq({
      "id"          => first_item.id,
      "name"        => first_item.name,
      "description" => first_item.description,
      "unit_price"  => first_item.unit_price,
      "merchant_id" => first_item.merchant_id,
      "created_at"  => format_date(first_item.created_at),
      "updated_at"  => format_date(first_item.updated_at)
    })
  end
end
