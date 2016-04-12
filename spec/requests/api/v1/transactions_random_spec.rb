require "rails_helper"

RSpec.describe "GET /api/v1/transactions/random" do
  it "returns a random transaction" do
    first_transaction  = create(:transaction, invoice_id: 1)
    second_transaction = create(:transaction, invoice_id: 2)

    get "/api/v1/transactions/random"

    expect(json_body.count).to eq(1)
  end
end
