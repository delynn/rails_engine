require "rails_helper"

RSpec.describe "GET /api/v1/items/:id" do
  it "returns an item" do
    first_item  = create(:item, name: "Yeezy Boost 350")
    second_item = create(:item, name: "Air Force Ones")
    third_item  = create(:item, name: "Cement 3's")

    get "/api/v1/items/#{second_item.id}"

    expect(json_body).to eq({
      "id"          => second_item.id,
      "name"        => second_item.name,
      "description" => second_item.description,
      "unit_price"  => format_price(second_item.unit_price),
      "merchant_id" => second_item.merchant_id,
      "created_at"  => format_date(second_item.created_at),
      "updated_at"  => format_date(second_item.updated_at)
    })
  end
end
