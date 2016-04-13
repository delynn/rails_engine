require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/:id/invoice" do
  it "returns the assocaited invoice" do
    invoice_item = create(:invoice_item)
    invoice_item.update(invoice_id: create(:invoice).id)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    invoice = invoice_item.invoice
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
