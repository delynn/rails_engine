require "rails_helper"

RSpec.describe "GET api/v1/customers/find_all?attr=value" do
  it "returns a list of all customers" do
    first_customer = create(:customer)
    second_customer = create(:customer, first_name: "Amanda")
    third_customer = create(:customer, last_name: "La Tour")
    fourth_customer = create(:customer, first_name: "Bob", last_name: "La Tour")

    get "/api/v1/customers/find_all?last_name=Feliciano"

    expect(json_body.count).to eq(2)

    first_customer_json = json_body[0]
    expect(first_customer_json).to eq({
      "id"         => first_customer.id,
      "first_name" => first_customer.first_name,
      "last_name"  => first_customer.last_name,
      "created_at" => format_date(first_customer.created_at),
      "updated_at" => format_date(first_customer.updated_at)
    })

    get "/api/v1/customers/find_all?last_name=La Tour"

    expect(json_body.count).to eq(2)

    third_customer_json = json_body[0]
    expect(third_customer_json).to eq({
      "id"         => third_customer.id,
      "first_name" => third_customer.first_name,
      "last_name"  => third_customer.last_name,
      "created_at" => format_date(third_customer.created_at),
      "updated_at" => format_date(third_customer.updated_at)
    })
  end
end
