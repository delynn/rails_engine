module ApiHelpers
  def json_body
    JSON.parse(response.body)
  end

  def format_date(date)
    date.strftime("%Y-%m-%dT%H:%M:%S.%LZ")
  end

  def format_price(price)
    (price.to_f / 100).to_s
  end
end

RSpec.configure do |config|
  config.include ApiHelpers, type: :request
end
