module Api
  module V1
    class MerchantFavoriteCustomerController < ApiController
      def show
        customer_id = Invoice.merchant_favorite_customer(params[:id]) 
        respond_with Customer.find(customer_id)
      end
    end
  end
end
