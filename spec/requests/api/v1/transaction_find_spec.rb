require "rails_helper"

RSpec.describe "GET /api/v1/transactions/find?attr=value" do
  it "returns a transaction" do
    first_transaction  = create(:transaction, invoice_id: 1)
    second_transaction = create(:transaction, invoice_id: 2)
    third_transaction  = create(:transaction, invoice_id: 3)

    get "/api/v1/transactions/find?id=#{second_transaction.id}"

    expect(json_body).to eq({
      "id"                 => second_transaction.id,
      "invoice_id"         => second_transaction.invoice_id,
      "credit_card_number" => second_transaction.credit_card_number,
      "result"             => second_transaction.result,
      "created_at"         => format_date(second_transaction.created_at),
      "updated_at"         => format_date(second_transaction.updated_at)
    })

    get "/api/v1/transactions/find?invoice_id=#{third_transaction.invoice_id}"

    expect(json_body).to eq({
      "id"                 => third_transaction.id,
      "invoice_id"         => third_transaction.invoice_id,
      "credit_card_number" => third_transaction.credit_card_number,
      "result"             => third_transaction.result,
      "created_at"         => format_date(third_transaction.created_at),
      "updated_at"         => format_date(third_transaction.updated_at)
    })
  end
end
