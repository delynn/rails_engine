Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/customers/find",      to: "customers#find"
      get "/customers/find_all",  to: "customers#find_all"
      resources :customers,     only: [:index, :show]

      get "/invoice_items/find",     to: "invoice_items_finder#show"
      get "/invoice_items/find_all", to: "invoice_items_finder#index"
      resources :invoice_items,    only: [:index, :show]

      get "/invoices/find",       to: "invoices#find"
      get "/invoices/find_all",   to: "invoices#find_all"
      resources :invoices,      only: [:index, :show]

      get "/items/find",          to: "items_finder#show"
      get "/items/find_all",      to: "items_finder#index"
      resources :items,         only: [:index, :show]

      get "/merchants/find",      to: "merchants#find"
      get "/merchants/find_all",  to: "merchants#find_all"
      resources :merchants,     only: [:index, :show]

      get "/transactions/find",     to: "transactions_finder#show"
      get "/transactions/find_all", to: "transactions_finder#index"
      resources :transactions,    only: [:index, :show]
    end
  end
end
