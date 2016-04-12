require "rails_helper"

RSpec.describe "GET /api/v1/customers" do
  it "returns a list of all customer" do
    first_customer  = create(:customer, first_name: "Jack")
    second_customer = create(:customer, first_name: "Jill")
    third_customer  = create(:customer, first_name: "Bob")

    get "/api/v1/customers"

    expect(json_body.count).to eq(3)

    first_customer_json = json_body[0]

    expect(first_customer_json).to eq({
      "id"         => first_customer.id,
      "first_name" => first_customer.first_name,
      "last_name"  => first_customer.last_name,
      "created_at" => format_date(first_customer.created_at),
      "updated_at" => format_date(first_customer.updated_at)
    })
  end
end
