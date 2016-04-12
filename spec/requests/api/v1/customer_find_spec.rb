require "rails_helper"

RSpec.describe "GET /api/v1/customers/find?attr=value" do
  it "returns a customer" do
    first_customer  = create(:customer)
    second_customer = create(:customer, first_name: "Amanda")
    third_customer  = create(:customer, first_name: "Lillian")

    get "/api/v1/customers/find?id=#{second_customer.id}"

    expect(json_body).to eq({
      "id"         => second_customer.id,
      "first_name" => second_customer.first_name,
      "last_name"  => second_customer.last_name,
      "created_at" => format_date(second_customer.created_at),
      "updated_at" => format_date(second_customer.updated_at)
    })

    get "/api/v1/customers/find?first_name=#{third_customer.first_name.upcase}"

    expect(json_body).to eq({
      "id"         => third_customer.id,
      "first_name" => third_customer.first_name,
      "last_name"  => third_customer.last_name,
      "created_at" => format_date(third_customer.created_at),
      "updated_at" => format_date(third_customer.updated_at)
    })
  end
end
