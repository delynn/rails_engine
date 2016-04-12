require "rails_helper"

RSpec.describe "GET /api/v1/customers/random" do
  it "returns a random customer" do
    first_customer  = create(:customer, first_name: "Julian")
    second_customer = create(:customer, first_name: "Amanda")

    get "/api/v1/customers/random"

    expect(json_body.count).to eq(1)
    random_customer_json = json_body[0]
  end
end
