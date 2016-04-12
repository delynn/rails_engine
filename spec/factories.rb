FactoryGirl.define do
  factory :invoice_item do
    item_id 1
    invoice_id 1
    quantity 1
    unit_price 1
  end
  
  factory :customer do
    first_name "Julian"
    last_name  "Feliciano"
  end
end