FactoryGirl.define do
  factory :transaction do
    invoice_id 1
    credit_card_number 1
    credit_card_expiration_date "MyString"
    result "MyString"
  end
  
  factory :merchant do
    name "MyString"
  end

  factory :item do
    name "MyString"
    description "MyString"
    unit_price 1
    merchant_id 1
  end

  factory :invoice do
    customer_id 1
    merchant_id 1
    status "MyString"
  end

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
