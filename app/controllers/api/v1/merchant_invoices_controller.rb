module Api
  module V1
    class MerchantInvoicesController < ApiController
      def index
        respond_with Merchant.find(params[:id]).invoices
      end
    end
  end
end
