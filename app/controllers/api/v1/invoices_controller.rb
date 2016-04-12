module Api
  module V1
    class InvoicesController < ApiController
      def index
        respond_with Invoice.all
      end

      def show
        respond_with Invoice.find(params[:id])
      end

      def find
        respond_with Invoice.find_by(capitalize_hash_values(invoice_params))
      end

      def find_all
        respond_with Invoice.where(capitalize_hash_values(invoice_params))
      end

      private

      def invoice_params
        params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
      end
    end
  end
end
