class Invoice < ActiveRecord::Base
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status,      presence: true
  belongs_to :merchant
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  scope :revenue_by_merchant, -> merchant_id {
    (where(merchant_id: merchant_id).joins(:transactions).where("transactions.result = 'success'").
    joins(:invoice_items).sum("quantity * unit_price").to_f / 100).to_s
  }

  scope :revenue_by_merchant_date, -> merchant_id, date {
    (where("merchant_id = ? AND invoices.created_at = ?", merchant_id, date).joins(:transactions).where("transactions.result = 'success'").
    joins(:invoice_items).sum("quantity * unit_price").to_f / 100).to_s
  }

  scope :merchant_pending_invoice_customers, -> merchant_id {
    (where(merchant_id: merchant_id).joins(:transactions).where("transactions.result = ?", "failed").map(&:customer).uniq)
  }
end
