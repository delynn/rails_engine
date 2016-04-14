class Transaction < ActiveRecord::Base
  validates :invoice_id,         presence: true
  validates :credit_card_number, presence: true
  validates :result,             presence: true
  belongs_to :invoice

  scope :random, -> { limit(1).order("RANDOM()") }
end
