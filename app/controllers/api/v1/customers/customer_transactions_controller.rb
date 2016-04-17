module Api
  module V1
    module Customers
      class CustomerTransactionsController < ApiController
        def index
          respond_with Invoice.transactions(params[:id])
        end
      end
    end
  end
end
