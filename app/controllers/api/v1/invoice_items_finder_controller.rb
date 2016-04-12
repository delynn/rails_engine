module Api
  module V1
    class InvoiceItemsFinderController < ApiController
      def index
        respond_with InvoiceItem.where(invoice_params)
      end

      def show
        respond_with InvoiceItem.find_by(invoice_params)
      end

      private

      def invoice_params
        params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price)
      end
    end
  end
end
