class Merchant < ActiveRecord::Base
  validates :name, presence: true

  before_save do
    name.capitalize!
  end
end
