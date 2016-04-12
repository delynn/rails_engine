require "rails_helper"

RSpec.describe "GET /api/v1/transactions/find_all?attr=value" do
  it "returns a list of all transactions" do
    first_transaction = create(:transaction, credit_card_number: 1234)
    second_transaction = create(:transaction, credit_card_number: 1234)
    third_transaction = create(:transaction, credit_card_number: 4321)
    fourth_transaction = create(:transaction, credit_card_number: 4321)

    get "/api/v1/transactions/find_all?credit_card_number=#{first_transaction.credit_card_number}"

    expect(json_body.count).to eq(2)

    first_transaction_json = json_body[0]
    expect(first_transaction_json).to eq({
      "id"                 => first_transaction.id,
      "invoice_id"         => first_transaction.invoice_id,
      "credit_card_number" => first_transaction.credit_card_number,
      "result"             => first_transaction.result,
      "created_at"         => format_date(first_transaction.created_at),
      "updated_at"         => format_date(first_transaction.updated_at)
    })
  end
end
