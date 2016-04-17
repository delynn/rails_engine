module Api
  module V1
    module Items
      class ItemInvoiceItemsController < ApiController
        def index
          respond_with Item.find(params[:id]).invoice_items
        end
      end
    end
  end
end
