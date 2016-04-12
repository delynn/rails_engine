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

    factory :merchant_with_invoices do

      transient do
        invoices_count 3
      end

      after(:create) do |merchant, evaluator|
        create_list(:invoice, evaluator.invoices_count, merchant: merchant)
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


    factory :invoice_with_transactions do

      transient do
        transactions_count 3
      end

      after(:create) do |invoice, evaluator|
        create_list(:transaction, evaluator.transactions_count, invoice: invoice)
      end
    end

    factory :invoice_with_invoice_items do

      transient do
        invoice_items_count 3
      end

      after(:create) do |invoice, evaluator|
        create_list(:invoice_item, evaluator.invoice_items_count, invoice: invoice)
      end
    end
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
