module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    def capitalize_hash_values(hash)
      hash.each_value(&:capitalize!)
    end
    
    def convert_unit_price
      if params.keys.include? "unit_price"
        params[:unit_price] = (params[:unit_price].to_f * 100).round
      end
    end
  end
end
