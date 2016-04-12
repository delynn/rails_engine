require "rails_helper"

RSpec.describe "GET /api/v1/items/find_all?attr=val" do
  it "returns a list of items" do
    first_item  = create(:item, name: "Stuff", unit_price: 300)
    second_item = create(:item, name: "Other", unit_price: 300)
    third_item  = create(:item, name: "Things", unit_price: 400)
    fourth_item = create(:item, name: "Yes", unit_price: 400)

    get "/api/v1/items/find_all?unit_price=#{first_item.unit_price}"

    expect(json_body.count).to eq(2)

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
