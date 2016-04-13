class Merchant < ActiveRecord::Base
  validates :name, presence: true
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  scope :most_revenue_ids, -> quantity {
    joins(:invoice_items).group("merchants.id").order('sum_quantity_all_unit_price DESC').limit(quantity).sum("quantity * unit_price").keys
  }
end
