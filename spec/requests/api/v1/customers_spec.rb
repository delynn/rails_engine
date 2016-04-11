require "rails_helper"

RSpec.describe "GET /api/v1/customers" do
  it "returns a list of all customer" do
    first_customer  = create(:customer)
    second_customer = create(:customer)
    third_customer  = create(:customer)

    get "api/v1/customers"

    expect(json_body["customers"].count).to eq(3)

    first_customer_json = json_body["customers"][0]
    expect(first_customer_json).to eq({
      "id" => first_customer_json.id,
      "first_name" => first_customer_json.first_name,
      "last_name"  => first_customer_json.last_name,
      "created_at" => first_customer_json.created_at,
      "updated_at" => first_customer_json.updated_at
    })
  end
end
