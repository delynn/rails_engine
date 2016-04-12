Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/customers/find",      to: "customers#find"
      resources :customers,     only: [:index, :show]

      get "/invoice_items/find",  to: "invoice_items_finder#show"
      resources :invoice_items, only: [:index, :show]

      get "/invoices/find",       to: "invoices#find"
      resources :invoices,      only: [:index, :show]

      get "/items/find",          to: "items_finder#show"
      resources :items,         only: [:index, :show]
      resources :merchants,     only: [:index, :show]
      resources :transactions,  only: [:index, :show]
    end
  end
end
