module Api
  module V1
    module Merchants
      class MerchantsRevenueController < ApiController
        def index
          merchant_ids = Merchant.most_revenue_ids(params[:quantity])
          respond_with merchant_ids.map { |id| Merchant.find(id) }
        end

        def show
          respond_with Invoice.revenue_for_date(params[:date])
        end
      end
    end
  end
end
