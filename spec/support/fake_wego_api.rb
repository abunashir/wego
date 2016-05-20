module FakeWegoApi
  def stub_get_location_api(options = {})
    stub_request(:get, api_path("locations/search", options)).
      to_return(response_with(file: "locations", status: 200))
  end

  def stub_new_search_api(search_terms)
    stub_request(:get, api_path("search/new", search_terms)).
      to_return(response_with(file: "search", status: 200))
  end

  def stub_search_results_api(search_id, options = {})
    stub_request(:get, api_path("search/#{search_id}", options)).
      to_return(response_with(file: "results", status: 200))
  end

  def stub_search_result_api(search_id:, hotel_id:)
    stub_request(:get, api_path("search/#{search_id}", hotel_id: hotel_id)).
      to_return(response_with(file: "result", status: 200))
  end

  private

  def api_path(end_point, attributes = {})
    [wego_api_url(end_point), serlized_options(attributes)].join("?")
  end

  def wego_api_url(end_point)
    [Wego.configuration.api_host, end_point].join("/")
  end

  def serlized_options(attributes = {})
    api_params = Wego.configuration.api_keys.merge attributes
    api_params.map { |key, value| "#{key}=#{value}" }.join("&")
  end

  def response_with(file:, status:)
    { body: fixture_file(file), status: status }
  end

  def fixture_file(filename)
    File.read "./spec/fixtures/#{filename}.json"
  end
end
