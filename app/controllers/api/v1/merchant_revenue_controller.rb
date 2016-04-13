module Api
  module V1
    class MerchantRevenueController < ApiController
      def show
        revenue = Hash.new

        if params[:date]
          revenue[:revenue] = Invoice.revenue_by_merchant_date(params[:id], params[:date])
        else
          revenue[:revenue] = Invoice.revenue_by_merchant(params[:id])
        end
        respond_with revenue
      end
    end
  end
end
