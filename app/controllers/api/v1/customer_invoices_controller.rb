module Api
  module V1
    class CustomerInvoicesController < ApiController
      def index
        respond_with Customer.find(params[:id]).invoices
      end
    end
  end
end
