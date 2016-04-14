class Customer < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name,  presence: true
  has_many :invoices

  scope :random, -> { limit(1).order("RANDOM()") }

  scope :favorite_merchant, -> customer_id {
    where(id: customer_id).joins(:invoices)
                          .group("invoices.merchant_id")
                          .count.max_by { |k, v| v }[0]
  }
end
