module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    def capitalize_hash_values(hash)
      hash.each_value(&:capitalize!)
    end
  end
end
