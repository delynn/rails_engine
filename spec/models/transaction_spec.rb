require 'rails_helper'

RSpec.describe Transaction, "validations" do
  it { is_expected.to validate_presence_of(:invoice_id) }
  it { is_expected.to validate_presence_of(:credit_card_number) }
  it { is_expected.to validate_presence_of(:result) }
end
