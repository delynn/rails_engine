module Api
  module V1
    module Merchants
      class MerchantsController < ApiController
        def model
          Merchant
        end

        private

        def model_params
          params.permit(:id, :name, :created_at, :updated_at)
        end
      end
    end
  end
end
