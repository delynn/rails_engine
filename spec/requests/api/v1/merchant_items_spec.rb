require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id/items" do
  it "returns a list of items associated with merchant" do
    first_merchant  = create(:merchant_with_items, name: "Yolo")
    second_merchant = create(:merchant_with_items)

    get "/api/v1/merchants/#{first_merchant.id}/items"

    expect(json_body.count).to eq(3)

    first_item = first_merchant.items.first
    first_item_json = json_body[0]
    expect(first_item_json).to eq({
      "id"          => first_item.id,
      "name"        => first_item.name,
      "description" => first_item.description,
      "unit_price"  => format_price(first_item.unit_price),
      "merchant_id" => first_item.merchant_id,
      "created_at"  => format_date(first_item.created_at),
      "updated_at"  => format_date(first_item.updated_at)
    })
  end
end
