module Api
  module V1
    module Items
      class ItemsFinderController < ApiController
        def model
          Item
        end

        def index
          respond_with Item.where(model_params)
        end

        def show
          respond_with Item.find_by(model_params)
        end

        private

        def model_params
          convert_unit_price
          params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
        end
      end
    end
  end
end
