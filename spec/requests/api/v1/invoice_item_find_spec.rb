require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/find?attr=value" do
  it "returns an invoice item" do
    first_invoice_item  = create(:invoice_item, item_id: 1)
    second_invoice_item = create(:invoice_item, item_id: 2)
    third_invoice_item  = create(:invoice_item, item_id: 3)

    get "/api/v1/invoice_items/find?id=#{second_invoice_item.id}"

    expect(json_body).to eq({
      "id"         => second_invoice_item.id,
      "item_id"    => second_invoice_item.item_id,
      "invoice_id" => second_invoice_item.invoice_id,
      "quantity"   => second_invoice_item.quantity,
      "unit_price" => format_price(second_invoice_item.unit_price),
      "created_at" => format_date(second_invoice_item.created_at),
      "updated_at" => format_date(second_invoice_item.updated_at)
    })

    get "/api/v1/invoice_items/find?item_id=#{third_invoice_item.item_id}"

    expect(json_body).to eq({
      "id"         => third_invoice_item.id,
      "item_id"    => third_invoice_item.item_id,
      "invoice_id" => third_invoice_item.invoice_id,
      "quantity"   => third_invoice_item.quantity,
      "unit_price" => format_price(third_invoice_item.unit_price),
      "created_at" => format_date(third_invoice_item.created_at),
      "updated_at" => format_date(third_invoice_item.updated_at)
    })
  end
end
