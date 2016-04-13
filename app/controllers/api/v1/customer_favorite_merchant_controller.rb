module Api
  module V1
    class CustomerFavoriteMerchantController < ApiController
      def show
        merchant_id = Customer.favorite_merchant(params[:id])
        respond_with Merchant.find(merchant_id)
      end
    end
  end
end
