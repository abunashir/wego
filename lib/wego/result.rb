module Wego
  class Result
    attr_reader :search_id

    def initialize(search_id:)
      @search_id = search_id
    end

    def all
      get_search_results
    end

    def find(hotel_id)
      get_search_results(hotel_id: hotel_id)
    end

    def self.find_by(search_id:, hotel_id:)
      result = new(search_id: search_id)
      result.find(hotel_id)
    end

    private

    def get_search_results(api_params = {})
      Wego.get_resource "search/#{search_id}", api_params
    end
  end
end
