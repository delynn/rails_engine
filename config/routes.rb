Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :customers,     only: [:index]
      resources :invoice_items, only: [:index]
      resources :invoices,      only: [:index]
      resources :items,         only: [:index]
      resources :merchants,     only: [:index]
    end
  end
end
