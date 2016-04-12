class Merchant < ActiveRecord::Base
  validates :name, presence: true
  has_many :items

  before_save do
    name.capitalize!
  end
end
