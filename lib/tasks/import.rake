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
end
