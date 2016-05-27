module Api
  module V1
    module Invoices
      class InvoicesController < ApiController
        def model
          Invoice
        end

        def items
          respond_with Invoice.find(params[:id]).items
        end

        private

        def model_params
          params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
        end
      end
    end
  end
end
