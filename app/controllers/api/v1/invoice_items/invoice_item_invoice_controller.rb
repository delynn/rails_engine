module Api
  module V1
    module InvoiceItems
      class InvoiceItemInvoiceController < ApiController
        def show
          respond_with InvoiceItem.find(params[:id]).invoice
        end
      end
    end
  end
end
