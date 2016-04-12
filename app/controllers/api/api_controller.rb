module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    def downcase_hash_values(hash)
      hash.each_value(&:downcase!)
    end
  end
end
