class Customer < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name,  presence: true
  has_many :invoices

  before_save do
    first_name.capitalize!
    last_name.capitalize!
  end
end
