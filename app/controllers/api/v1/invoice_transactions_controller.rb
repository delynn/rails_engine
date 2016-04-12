module Api
  module V1
    class InvoiceTransactionsController < ApiController
      def index
        respond_with Invoice.find(params[:id]).transactions
      end
    end
  end
end
