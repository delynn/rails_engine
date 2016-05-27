module Api
  module V1
    module InvoiceItems
      class InvoiceItemsController < ApiController
        def model
          InvoiceItem
        end
      end
    end
  end
end
