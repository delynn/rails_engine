module Api
  module V1
    class MerchantsRevenueController < ApiController
      def index
        merchant_ids = Merchant.most_revenue_ids(params[:quantity])
        respond_with merchant_ids.map { |id| Merchant.find(id) }
      end
    end
  end
end
