module Api
  module V1
    module InvoiceItems
      class InvoiceItemsFinderController < ApiController
        def index
          respond_with InvoiceItem.where(invoice_params)
        end

        def show
          respond_with InvoiceItem.find_by(invoice_params)
        end

        def random
          respond_with InvoiceItem.random
        end

        private

        def invoice_params
          convert_unit_price
          params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
        end
      end
    end
  end
end
