require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/random" do
  it "returns a random invoice item" do
    first_invoice_item = create(:invoice_item, invoice_id: 1)
    second_invoice_item = create(:invoice_item, invoice_id: 2)

    get "/api/v1/invoice_items/random"

    expect(json_body.count).to eq(1)
  end
end
