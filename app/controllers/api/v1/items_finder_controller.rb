module Api
  module V1
    class ItemsFinderController < ApiController
      def index
        respond_with Item.where(capitalize_hash_values(item_params))
      end

      def show
        respond_with Item.find_by(capitalize_hash_values(item_params))
      end

      def random
        respond_with Item.limit(1).order("RANDOM()")
      end

      private

      def item_params
        params.permit(:id, :name, :unit_price, :merchant_id, :created_at, :updated_at)
      end
    end
  end
end
