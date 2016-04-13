require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/:id/item" do
  it "returns the associated item" do
    invoice_item = create(:invoice_item)
    invoice_item.update(item_id: create(:item).id)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    item = invoice_item.item
    item_json = json_body
    expect(item_json).to eq({
      "id"          => item.id,
      "name"        => item.name,
      "description" => item.description,
      "unit_price"  => item.unit_price,
      "merchant_id" => item.merchant_id,
      "created_at"  => format_date(item.created_at),
      "updated_at"  => format_date(item.updated_at)
    })
  end
end
