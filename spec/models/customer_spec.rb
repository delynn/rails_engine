require 'rails_helper'

RSpec.describe Customer, "validations" do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
end

RSpec.describe Customer, type: :model do
  it "capitalize attributes when saved" do
    customer = Customer.create(first_name: "JULIAN", last_name: "FELICIANO")

    expect(customer.first_name).to eq("Julian")
    expect(customer.last_name).to  eq("Feliciano")
  end
end
