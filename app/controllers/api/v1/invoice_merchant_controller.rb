module Api
  module V1
    class InvoiceMerchantController < ApiController
      def show
        respond_with Invoice.find(params[:id]).merchant
      end
    end
  end
end
