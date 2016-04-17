module Api
  module V1
    module InvoiceItems
      class InvoiceItemItemController < ApiController
        def show
          respond_with InvoiceItem.find(params[:id]).item
        end
      end
    end
  end
end
