require "rails_helper"

RSpec.describe "GET /api/v1/invoices" do
  it "returns a list of all invoices" do
    first_invoice  = create(:invoice)
    second_invoice = create(:invoice)
    third_invoice  = create(:invoice)

    get "/api/v1/invoices"

    expect(json_body.count).to eq(3)

    first_invoice_json = json_body[0]
    expect(first_invoice_json).to eq({
      "id" => first_invoice.id,
      "customer_id" => first_invoice.customer_id,
      "merchant_id" => first_invoice.merchant_id,
      "status"      => first_invoice.status,
      "created_at"  => format_date(first_invoice.created_at),
      "updated_at"  => format_date(first_invoice.updated_at)
    })
  end
end
