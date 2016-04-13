require "rails_helper"

RSpec.describe "GET /api/v1/customers/:id/transactions" do
  it "returns a collection of associated transactions" do
    customer = create(:customer)
    invoice = create(:invoice)
    invoice.update(customer_id: customer.id)
    invoice.transactions << create(:transaction, invoice_id: invoice.id)
    invoice.transactions << create(:transaction, invoice_id: invoice.id)

    get "/api/v1/customers/#{customer.id}/transactions"
    
    expect(json_body.count).to eq(2)

    first_transaction = invoice.transactions.first
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
