module Api
  module V1
    class ItemMerchantController < ApiController
      def show
        respond_with Item.find(params[:id]).merchant
      end
    end
  end
end
