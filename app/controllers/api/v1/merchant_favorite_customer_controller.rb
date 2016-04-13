module Api
  module V1
    class MerchantFavoriteCustomerController < ApiController
      def show
        customer_id = Invoice.where(merchant_id: params[:id]).joins(:transactions).where("transactions.result = ?", "success").group(:customer_id).count.max_by { |k, v| v }[0]
        respond_with Customer.find(customer_id)
      end
    end
  end
end
