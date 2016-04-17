module Api
  module V1
    module InvoiceItems
      class InvoiceItemsController < ApiController
        def index
          respond_with InvoiceItem.all
        end

        def show
          respond_with InvoiceItem.find(params[:id])
        end
      end
    end
  end
end
