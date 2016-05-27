module Api
  module V1
    module Transactions
      class TransactionsFinderController < ApiController
        def model
          Transaction
        end

        def index
          respond_with Transaction.where(model_params)
        end

        def show
          respond_with Transaction.find_by(model_params)
        end

        private

        def model_params
          params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
        end
      end
    end
  end
end
