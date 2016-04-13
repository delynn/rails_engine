module Api
  module V1
    class InvoiceItemsFinderController < ApiController
      def index
        respond_with InvoiceItem.where(invoice_params)
      end

      def show
        respond_with InvoiceItem.find_by(invoice_params)
      end

      def random
        respond_with InvoiceItem.limit(1).order("RANDOM()")
      end

      private

      def invoice_params
        params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
      end
    end
  end
end
