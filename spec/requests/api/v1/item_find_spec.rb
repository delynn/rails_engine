require "rails_helper"

RSpec.describe "GET /api/v1/items/find?attr=value" do
  it "returns an item" do
    first_item  = create(:item, name: "Yeezy Boost 350")
    second_item = create(:item, name: "Jordan Bred 4's")
    third_item  = create(:item, name: "Timberlands")

    get "/api/v1/items/find?id=#{second_item.id}"

    expect(json_body).to eq({
      "id"          => second_item.id,
      "name"        => second_item.name,
      "description" => second_item.description,
      "unit_price"  => second_item.unit_price,
      "merchant_id" => second_item.merchant_id,
      "created_at"  => format_date(second_item.created_at),
      "updated_at"  => format_date(second_item.updated_at)
    })

    get "/api/v1/items/find?name=#{first_item.name}"

    expect(json_body).to eq({
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
