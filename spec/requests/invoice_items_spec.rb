require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items" do
  it "returns a list of all invoice items" do
    first_invoice_item  = create(:invoice_item, item_id: 1, quantity: 2)
    second_invoice_item = create(:invoice_item, item_id: 2, quantity: 3)
    third_invoice_item  = create(:invoice_item, item_id: 3, quantity: 4)

    get "/api/v1/invoice_items"

    expect(json_body.count).to eq(3)

    first_invoice_item_json = json_body[0]
    expect(first_invoice_item_json).to eq({
      "id"         => first_invoice_item.id,
      "item_id"    => first_invoice_item.item_id,
      "invoice_id" => first_invoice_item.invoice_id,
      "quantity"   => first_invoice_item.quantity,
      "unit_price" => first_invoice_item.unit_price,
      "created_at" => format_date(first_invoice_item.created_at),
      "updated_at" => format_date(first_invoice_item.updated_at)
    })
  end
end
