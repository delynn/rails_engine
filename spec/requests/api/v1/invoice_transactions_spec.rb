require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/transactions" do
  it "returns a collection of associated transactions" do
    first_invoice  = create(:invoice_with_transactions, customer_id: 1)
    second_invoice = create(:invoice_with_transactions, customer_id: 2)

    get "/api/v1/invoices/#{first_invoice.id}/transactions"

    expect(json_body.count).to eq(3)

    first_transaction = first_invoice.transactions.first
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
