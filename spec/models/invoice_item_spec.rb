require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { is_expected.to validate_presence_of(:item_id) }
  it { is_expected.to validate_presence_of(:invoice_id) }
  it { is_expected.to validate_presence_of(:quantity) }
  it { is_expected.to validate_presence_of(:unit_price) }
end
