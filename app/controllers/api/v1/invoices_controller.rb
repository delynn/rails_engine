module Api
  module V1
    class InvoicesController < ApplicationController
      def index
        respond_with Invoice.all
      end
    end
  end
end
