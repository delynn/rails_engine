module Api
  module V1
    module Customers
      class CustomersController < ApiController
        def model
          Customer
        end

        private

        def model_params
          params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
        end
      end
    end
  end
end
