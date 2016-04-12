require "rails_helper"

RSpec.describe "GET /api/v1/invoices/random" do
  it "returns a random invoice" do
    first_invoice  = create(:invoice, status: "yum")
    second_invoice = create(:invoice, status: "superyum")

    get "/api/v1/invoices/random"

    expect(json_body.count).to eq(1)
  end
end
