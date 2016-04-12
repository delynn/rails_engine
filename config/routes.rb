Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :customers,     only: [:index]
      resources :invoice_items, only: [:index]
    end
  end
end
