require "csv"

namespace :import do

  desc "Import customers from csv"
  task customers: :environment do
    filename = File.join(Rails.root, "/data", "customers.csv")
    counter = 0

    CSV.foreach(filename, headers: true) do |row|
      customer = Customer.create(id:          row["id"],
                                 first_name:  row["first_name"],
                                 last_name:   row["last_name"],
                                 created_at:  row["created_at"],
                                 updated_at:  row["updated_at"])
      if customer.errors.any?
        puts "#{row["first_name"]} #{row["last_name"]} - #{customer.errors.full_messages.join(", ")}"
      end
      counter += 1 if customer.persisted?
    end

    puts "Imported #{counter} customers"
  end

  desc "Import invoice items from csv"
  task invoice_items: :environment do
    filename = File.join(Rails.root, "/data", "invoice_items.csv")
    counter = 0

    CSV.foreach(filename, headers: true) do |row|
      invoice_item = InvoiceItem.create(id: row["id"],
                                        item_id: row["item_id"],
                                        invoice_id: row["invoice_id"],
                                        quantity: row["quantity"],
                                        unit_price: row["unit_price"],
                                        created_at: row["created_at"],
                                        updated_at: row["updated_at"])
      if invoice_item.errors.any?
        puts "#{row["id"]} - #{invoice_item.errors.full_messages.join(", ")}"
      end
      counter += 1 if invoice_item.persisted?
    end

    puts "Imported #{counter} invoice items"
  end

  desc "Import invoices from csv"
  task invoices: :environment do
    filename = File.join(Rails.root, "/data", "invoices.csv")
    counter = 0

    CSV.foreach(filename, headers: true) do |row|
      invoice = Invoice.create(id: row["id"],
                               customer_id: row["customer_id"],
                               merchant_id: row["merchant_id"],
                               status:      row["status"],
                               created_at:  row["created_at"],
                               updated_at:  row["updated_at"])
      if invoice.errors.any?
        puts "#{row["id"]} - #{invoice.errors.full_messages.join(", ")}"
      end
      counter += 1 if invoice.persisted?
    end

    puts "Imported #{counter} invoices"
  end

  desc "Import all csv data"
  task all: [:customers, :invoice_items, :invoices]
end
