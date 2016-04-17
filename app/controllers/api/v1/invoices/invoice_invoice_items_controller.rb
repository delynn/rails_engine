module Api
  module V1
    module Invoices
      class InvoiceInvoiceItemsController < ApiController
        def index
          respond_with Invoice.find(params[:id]).invoice_items
        end
      end
    end
  end
end
