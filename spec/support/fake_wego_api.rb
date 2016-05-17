module FakeWegoApi
  def stub_get_location_api(location:)
    stub_request(:get, api_path("locations/search", q: location)).
      to_return(response_with(file: "locations", status: 200))
  end

  private

  def api_path(end_point, attributes = {})
    [wego_api_url(end_point), serlized_options(attributes)].join("?")
  end

  def wego_api_url(end_point)
    [wego_api_host, end_point].join("/")
  end

  def serlized_options(attributes = {})
    attributes.merge(api_keys).map { |key, value| "#{key}=#{value}" }.join("&")
  end

  def wego_api_host
    "http://api.wego.com/hotels/api"
  end

  def response_with(file:, status:)
    { body: fixture_file(file), status: status }
  end

  def fixture_file(filename)
    File.read "./spec/fixtures/#{filename}.json"
  end

  def api_keys
    { ts_code: ENV["WAN_API_CODE"], key: ENV["WAN_API_KEY"] }
  end
end
