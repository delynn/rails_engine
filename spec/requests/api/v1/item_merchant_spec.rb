require "rails_helper"

RSpec.describe "GET /api/v1/items/:id/merchant" do
  it "returns the associated merchant" do
    item = create(:item)
    item.update(merchant_id: create(:merchant).id)

    get "/api/v1/items/#{item.id}/merchant"

    merchant = item.merchant
    merchant_json = json_body
    expect(merchant_json).to eq({
      "id"         => merchant.id,
      "name"       => merchant.name,
      "created_at" => format_date(merchant.created_at),
      "updated_at" => format_date(merchant.updated_at)
    })
  end
end
