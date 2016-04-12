module Api
  module V1
    class CustomersController < ApplicationController
      def index
        respond_with Customer.all
      end
    end
  end
end
