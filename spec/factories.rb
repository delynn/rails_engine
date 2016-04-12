FactoryGirl.define do
  factory :transaction do
    invoice_id 1
    credit_card_number 1
    result "MyString"
  end

  factory :merchant do
    name "MyString"

    factory :merchant_with_items do

      transient do
        items_count 3
      end

      after(:create) do |merchant, evaluator|
        create_list(:item, evaluator.items_count, merchant: merchant)
      end
    end
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
