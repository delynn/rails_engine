class Merchant < ActiveRecord::Base
  validates :name, presence: true
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  scope :most_revenue_ids, -> quantity {
    joins(:invoice_items).group("merchants.id").order('sum_quantity_all_unit_price DESC').limit(quantity).sum("quantity * unit_price").keys
  }

  scope :top_merchants_by_items_sold, -> quantity {
    joins([:invoice_items, :transactions]).where("transactions.result = ?", "success").group("merchants.id").order('sum_quantity DESC').limit(quantity).sum("quantity").keys
  }
end
