module Api
  module V1
    class MerchantPendingInvoiceCustomersController < ApiController
      def index
        respond_with Invoice.merchant_pending_invoice_customers(params[:id])
      end
    end
  end
end
