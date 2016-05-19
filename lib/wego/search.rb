require "wego/result"

module Wego
  class Search
    attr_reader :search_id

    def initialize(attrs = {})
      @search_id = attrs[:search_id]
    end

    def results
      Result.new(search_id: search_id).all
    end

    def self.find(search_id)
      new(search_id: search_id)
    end

    def self.create(search_terms)
      Wego.get_resource "search/new", search_terms
    end
  end
end
