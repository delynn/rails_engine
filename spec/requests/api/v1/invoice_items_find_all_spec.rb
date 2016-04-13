require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/find_all?attr=value" do
  it "returns all invoice items" do
    first_invoice_item  = create(:invoice_item, unit_price: 300)
    second_invoice_item = create(:invoice_item, item_id: 2, unit_price: 300)
    third_invoice_item  = create(:invoice_item, item_id: 3, unit_price: 600)
    fourth_invoice_item = create(:invoice_item, item_id: 4, unit_price: 600)

    get "/api/v1/invoice_items/find_all?unit_price=3.00"

    expect(json_body.count).to eq(2)

    first_invoice_item_json = json_body[0]
    expect(first_invoice_item_json).to eq({
      "id"         => first_invoice_item.id,
      "item_id"    => first_invoice_item.item_id,
      "invoice_id" => first_invoice_item.invoice_id,
      "quantity"   => first_invoice_item.quantity,
      "unit_price" => format_price(first_invoice_item.unit_price),
      "created_at" => format_date(first_invoice_item.created_at),
      "updated_at" => format_date(first_invoice_item.updated_at)
    })

    get "/api/v1/invoice_items/find_all?unit_price=6.00"

    expect(json_body.count).to eq(2)

    third_invoice_item_json = json_body[0]
    expect(third_invoice_item_json).to eq({
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
