class Merchant < ActiveRecord::Base
  validates :name, presence: true
  has_many :items
  has_many :invoices

  before_save do
    name.capitalize!
  end
end
