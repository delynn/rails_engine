class Customer < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name,  presence: true

  before_save do
    first_name.downcase!
    last_name.downcase!
  end
end
