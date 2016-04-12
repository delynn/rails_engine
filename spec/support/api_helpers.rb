module ApiHelpers
  def json_body
    JSON.parse(response.body)
  end

  def format_date(date)
    date.strftime("%Y-%m-%dT%H:%M:%S.%LZ")
  end
end

RSpec.configure do |config|
  config.include ApiHelpers, type: :request
end
