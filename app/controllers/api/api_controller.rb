module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    def index
      respond_with model.all
    end

    def show
      respond_with model.find(params[:id])
    end

    def find
      respond_with model.find_by(model_params)
    end

    def find_all
      respond_with model.where(model_params)
    end

    def random
      respond_with model.random
    end

    def capitalize_hash_values(hash)
      hash.each_value(&:capitalize!)
    end

    def convert_unit_price
      if params.keys.include? 'unit_price'
        params[:unit_price] = (params[:unit_price].to_f * 100).round
      end
    end
  end
end
