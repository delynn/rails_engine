require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id/invoices" do
  it "returns a collection of associated invoices" do
    first_merchant  = create(:merchant_with_invoices, name: "Target")
    second_merchant = create(:merchant_with_invoices, name: "Wally world")

    get "/api/v1/merchants/#{first_merchant.id}/invoices"

    expect(json_body.count).to eq(3)

    first_invoice = first_merchant.invoices.first
    first_invoice_json = json_body[0]
    expect(first_invoice_json).to eq({
      "id"           => first_invoice.id,
      "customer_id"  => first_invoice.customer_id,
      "merchant_id"  => first_invoice.merchant_id,
      "status"       => first_invoice.status,
      "created_at"   => format_date(first_invoice.created_at),
      "updated_at"   => format_date(first_invoice.updated_at)
    })
  end
end
