module Api
  module V1
    module InvoiceItems
      class InvoiceItemsFinderController < ApiController
        def model
          InvoiceItem
        end

        def index
          respond_with InvoiceItem.where(model_params)
        end

        def show
          respond_with InvoiceItem.find_by(model_params)
        end

        private

        def model_params
          convert_unit_price
          params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
        end
      end
    end
  end
end
