module Api
  module V1
    class TransactionsController < ApiController
      def index
        respond_with Transaction.all
      end
    end
  end
end
