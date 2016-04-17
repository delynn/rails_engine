module Api
  module V1
    module Invoices
      class InvoiceCustomerController < ApiController
        def show
          respond_with Invoice.find(params[:id]).customer
        end
      end
    end
  end
end
