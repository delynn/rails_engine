module Api
  module V1
    class InvoiceItemsController < ApplicationController
      def index
        respond_with InvoiceItem.all
      end
    end
  end
end
