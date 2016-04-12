require 'rails_helper'

RSpec.describe Customer, "validations" do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
end
