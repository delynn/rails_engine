require 'rails_helper'

RSpec.describe Invoice, "validations" do
  it { is_expected.to validate_presence_of(:customer_id) }
  it { is_expected.to validate_presence_of(:merchant_id) }
  it { is_expected.to validate_presence_of(:status) }
end
