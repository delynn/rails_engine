require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/customer" do
  it "returns the associated customer" do
    first_invoice = create(:invoice, merchant_id: 1)
    first_invoice.update(customer_id: create(:customer).id)

    get "/api/v1/invoices/#{first_invoice.id}/customer"

    customer = first_invoice.customer
    customer_json = json_body
    expect(customer_json).to eq({
      "id"         => customer.id,
      "first_name" => customer.first_name,
      "last_name"  => customer.last_name,
      "created_at" => format_date(customer.created_at),
      "updated_at" => format_date(customer.updated_at)
    })
  end
end
