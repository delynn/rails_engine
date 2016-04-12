module Api
  module V1
    class MerchantItemsController < ApiController
      def index
        respond_with Merchant.find(params[:id]).items
      end
    end
  end
end
