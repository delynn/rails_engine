require "rails_helper"

RSpec.describe "GET /api/v1/customers/:id/invoices" do
  it "returns a collection of associated invoices" do
    customer = create(:customer)
    customer.invoices.create(merchant_id: 1, status: "done")
    customer.invoices.create(merchant_id: 2, status: "pending")

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(json_body.count).to eq(2)

    first_invoice = customer.invoices.first
    first_invoice_json = json_body[0]
    expect(first_invoice_json).to eq({
      "id"          => first_invoice.id,
      "customer_id" => first_invoice.customer_id,
      "merchant_id" => first_invoice.merchant_id,
      "status"      => first_invoice.status,
      "created_at"  => format_date(first_invoice.created_at),
      "updated_at"  => format_date(first_invoice.updated_at)
    })
  end
end
