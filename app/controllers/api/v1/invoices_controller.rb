module Api
  module V1
    class InvoicesController < ApiController
      def index
        respond_with Invoice.all
      end
    end
  end
end
