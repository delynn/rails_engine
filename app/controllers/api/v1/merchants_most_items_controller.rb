module Api
  module V1
    class MerchantsMostItemsController < ApiController
      def index
        merchant_ids = Merchant.top_merchants_by_items_sold(params[:quantity])
        respond_with merchant_ids.map { |id| Merchant.find(id) }
      end
    end
  end
end
