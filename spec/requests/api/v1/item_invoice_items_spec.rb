require "rails_helper"

RSpec.describe "GET /api/v1/items/:id/invoice_items" do
  it "returns a collection of associated invoice items" do
    item = create(:item)
    item.invoice_items.create(invoice_id: 1, quantity: 1, unit_price: 444)
    item.invoice_items.create(invoice_id: 2, quantity: 2, unit_price: 555)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(json_body.count).to eq(2)

    first_item_invoice = item.invoice_items.first
    first_item_invoice_json = json_body[0]
    expect(first_item_invoice_json).to eq({
      "id"         => first_item_invoice.id,
      "item_id"    => first_item_invoice.item_id,
      "invoice_id" => first_item_invoice.invoice_id,
      "quantity"   => first_item_invoice.quantity,
      "unit_price" => format_price(first_item_invoice.unit_price),
      "created_at" => format_date(first_item_invoice.created_at),
      "updated_at" => format_date(first_item_invoice.updated_at)
    })
  end
end
