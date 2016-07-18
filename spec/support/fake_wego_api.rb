module FakeWegoApi
  def stub_get_location_api(options = {})
    stub_api_response("locations/search", options, filename: "locations")
  end

  def stub_new_search_api(search_terms)
    stub_api_response("search/new", search_terms, filename: "search")
  end

  def stub_search_results_api(search_id, options = {})
    stub_api_response("search/#{search_id}", options, filename: "results")
  end

  def stub_search_result_api(search_id:, hotel_id:)
    stub_api_response(
      "search/#{search_id}", { hotel_id: hotel_id }, filename: "result"
    )
  end

  def stub_invalid_api_response(status: 404)
    stub_api_response(
      "invalid/resource", {}, filename: "error", status: status
    )
  end

  private

  def stub_api_response(end_point, options, filename:, status: 200)
    stub_request(:get, api_path(end_point, options)).
      to_return(wego_api_response_with(filename: filename, status: status))
  end

  def api_path(end_point, attributes = {})
    Wego::Client.new(end_point, attributes).url
  end

  def wego_api_response_with(filename:, status:)
    { body: wego_fixture_file(filename), status: status }
  end

  def wego_fixture_file(filename)
    file_name = [filename, "json"].join(".")
    file_path = ["../../fixtures", file_name].join("/")

    File.read(File.expand_path(file_path, __FILE__))
  end
end
