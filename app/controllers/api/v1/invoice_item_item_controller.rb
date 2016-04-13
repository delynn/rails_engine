module Api
  module V1
    class InvoiceItemItemController < ApiController
      def show
        respond_with InvoiceItem.find(params[:id]).item
      end
    end
  end
end
