module Api
  module V1
    class InvoiceCustomerController < ApiController
      def show
        respond_with Invoice.find(params[:id]).customer
      end
    end
  end
end
