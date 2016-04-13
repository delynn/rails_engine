require "rails_helper"

RSpec.describe "GET /api/v1/transactions/:id/invoice" do
  it "returns the assocaited invoice" do
    transaction = create(:transaction)
    transaction.update(invoice_id: create(:invoice).id)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    invoice = transaction.invoice
    invoice_json = json_body
    expect(invoice_json).to eq({
      "id"          => invoice.id,
      "customer_id" => invoice.customer_id,
      "merchant_id" => invoice.merchant_id,
      "status"      => invoice.status,
      "created_at"  => format_date(invoice.created_at),
      "updated_at"  => format_date(invoice.updated_at)
    })
  end
end
