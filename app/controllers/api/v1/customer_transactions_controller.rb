module Api
  module V1
    class CustomerTransactionsController < ApiController
      def index
        respond_with Invoice.transactions(params[:id])
      end
    end
  end
end
