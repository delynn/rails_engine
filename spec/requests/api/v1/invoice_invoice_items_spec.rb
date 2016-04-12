require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/invoice_items" do
  it "returns a collection of assocaited invoice items" do
    first_invoice  = create(:invoice_with_invoice_items, customer_id: 1)
    second_invoice = create(:invoice_with_invoice_items, customer_id: 2)

    get "/api/v1/invoices/#{first_invoice.id}/invoice_items"

    expect(json_body.count).to eq(3)

    first_invoice_item = first_invoice.invoice_items.first
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
