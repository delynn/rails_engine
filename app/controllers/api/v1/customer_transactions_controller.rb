module Api
  module V1
    class CustomerTransactionsController < ApiController
      def index
        respond_with Invoice.where(customer_id: params[:id])
                            .map(&:transactions)
                            .flatten
      end
    end
  end
end
