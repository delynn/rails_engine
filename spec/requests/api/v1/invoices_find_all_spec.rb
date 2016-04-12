require "rails_helper"

RSpec.describe "GET /api/v1/invoices/find_all?attr=value" do
  it "returns all invoices" do
    first_invoice  = create(:invoice, customer_id: 1)
    second_invoice = create(:invoice, customer_id: 1)
    third_invoice  = create(:invoice, customer_id: 2)
    fourth_invoice = create(:invoice, customer_id: 2)

    get "/api/v1/invoices/find_all?customer_id=#{first_invoice.customer_id}"

    expect(json_body.count).to eq(2)

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
