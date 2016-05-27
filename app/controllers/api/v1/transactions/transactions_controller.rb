module Api
  module V1
    module Transactions
      class TransactionsController < ApiController
        def model
          Transaction
        end
      end
    end
  end
end
