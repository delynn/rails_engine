class InvoiceItem < ActiveRecord::Base
  validates :item_id,    presence: true
  validates :invoice_id, presence: true
  belongs_to :invoice
  belongs_to :item

  scope :random, -> { limit(1).order("RANDOM()") }
end
