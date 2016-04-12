module Api
  module V1
    class ItemsFinderController < ApiController
      def show
        respond_with Item.find_by(capitalize_hash_values(item_params))
      end

      private

      def item_params
        params.permit(:id, :name, :unit_price, :merchant_id)
      end
    end
  end
end
