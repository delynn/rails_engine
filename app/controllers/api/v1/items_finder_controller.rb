module Api
  module V1
    class ItemsFinderController < ApiController
      def index
        respond_with Item.where(item_params)
      end

      def show
        respond_with Item.find_by(item_params)
      end

      def random
        respond_with Item.random
      end

      private

      def item_params
        convert_unit_price
        params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
      end
    end
  end
end
