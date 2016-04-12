module Api
  module V1
    class InvoiceItemsController < ApiController
      def index
        respond_with InvoiceItem.all
      end
    end
  end
end
