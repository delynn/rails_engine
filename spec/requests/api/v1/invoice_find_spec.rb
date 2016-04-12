require "rails_helper"

RSpec.describe "GET /api/v1/invoices/find?attr=value" do
  it "returns an invoice" do
    first_invoice  = create(:invoice, customer_id: 1)
    second_invoice = create(:invoice, customer_id: 2)
    third_invoice  = create(:invoice, customer_id: 3)

    get "/api/v1/invoices/find?id=#{second_invoice.id}"

    expect(json_body).to eq({
      "id"          => second_invoice.id,
      "customer_id" => second_invoice.customer_id,
      "merchant_id" => second_invoice.merchant_id,
      "status"      => second_invoice.status,
      "created_at"  => format_date(second_invoice.created_at),
      "updated_at"  => format_date(second_invoice.updated_at)
    })

    get "/api/v1/invoices/find?customer_id=#{third_invoice.customer_id}"

    expect(json_body).to eq({
      "id"          => third_invoice.id,
      "customer_id" => third_invoice.customer_id,
      "merchant_id" => third_invoice.merchant_id,
      "status"      => third_invoice.status,
      "created_at"  => format_date(third_invoice.created_at),
      "updated_at"  => format_date(third_invoice.updated_at)
    })
  end
end
