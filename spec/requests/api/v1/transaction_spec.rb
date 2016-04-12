require "rails_helper"

RSpec.describe "GET /api/v1/transactions/:id" do
  it "returns a transaction" do
    first_transaction  = create(:transaction, invoice_id: 1)
    second_transaction = create(:transaction, invoice_id: 2)
    third_transaxtion  = create(:transaction, invoice_id: 3)

    get "/api/v1/transactions/#{second_transaction.id}"

    expect(json_body).to eq({
      "id"                 => second_transaction.id,
      "invoice_id"         => second_transaction.invoice_id,
      "credit_card_number" => second_transaction.credit_card_number,
      "result"             => second_transaction.result,
      "created_at"         => format_date(second_transaction.created_at),
      "updated_at"         => format_date(second_transaction.updated_at)
    })
  end
end
