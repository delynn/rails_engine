Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :customers, only: [:index, :show], module: "customers" do
        collection do
          get "/find",     to: "customers#find"
          get "/find_all", to: "customers#find_all"
          get "/random",   to: "customers#random"
        end

        member do
          get "/invoices",          to: "customer_invoices#index"
          get "/transactions",      to: "customer_transactions#index"
          get "/favorite_merchant", to: "customer_favorite_merchant#show"
        end
      end

      resources :invoice_items, only: [:index, :show], module: "invoice_items" do
        collection do
          get "/find",     to: "invoice_items_finder#show"
          get "/find_all", to: "invoice_items_finder#index"
          get "/random",   to: "invoice_items_finder#random"
        end

        member do
          get "/invoice", to: "invoice_item_invoice#show"
          get "/item",    to: "invoice_item_item#show"
        end
      end

      resources :invoices, only: [:index, :show], module: "invoices" do
        collection do
          get "/find",     to: "invoices#find"
          get "/find_all", to: "invoices#find_all"
          get "/random",   to: "invoices#random"
        end

        member do
          get "/transactions",  to: "invoice_transactions#index"
          get "/invoice_items", to: "invoice_invoice_items#index"
          get "/items",         to: "invoices#items"
          get "/customer",      to: "invoice_customer#show"
          get "/merchant",      to: "invoice_merchant#show"
        end
      end

      resources :items, only: [:index, :show], module: "items" do
        collection do
          get "/find",     to: "items_finder#show"
          get "/find_all", to: "items_finder#index"
          get "/random",   to: "items_finder#random"
        end

        member do
          get "/invoice_items", to: "item_invoice_items#index"
          get "/merchant",      to: "item_merchant#show"
        end
      end

      resources :merchants, only: [:index, :show], module: "merchants" do
        collection do
          get "/find",         to: "merchants#find"
          get "/find_all",     to: "merchants#find_all"
          get "/random",       to: "merchants#random"
          get "/most_revenue", to: "merchants_revenue#index"
          get "/revenue",      to: "merchants_revenue#show"
        end

        member do
          get "/items",                           to: "merchant_items#index"
          get "/invoices",                        to: "merchant_invoices#index"
          get "/revenue",                         to: "merchant_revenue#show"
          get "/customers_with_pending_invoices", to: "merchant_pending_invoice_customers#index"
          get "/favorite_customer",               to: "merchant_favorite_customer#show"
        end
      end

      resources :transactions, only: [:index, :show], module: "transactions" do
        collection do
          get "/find",     to: "transactions_finder#show"
          get "/find_all", to: "transactions_finder#index"
          get "/random",   to: "transactions_finder#random"
        end

        member do
          get "/invoice", to: "transaction_invoice#show"
        end
      end
    end
  end
end
