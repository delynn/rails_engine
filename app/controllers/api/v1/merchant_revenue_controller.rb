module Api
  module V1
    class MerchantRevenueController < ApiController
      def show
        revenue = Hash.new
        revenue[:revenue] = Invoice.revenue_by_merchant(params[:id])
        respond_with revenue
      end
    end
  end
end
