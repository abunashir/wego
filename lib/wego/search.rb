module Wego
  class Search
    attr_reader :search_id

    def initialize(attrs = {})
      @search_id = attrs[:search_id]
    end

    def results
      Wego::Client.new("search/#{search_id}").get
    end

    def self.find(search_id)
      new(search_id: search_id)
    end

    def self.create(search_terms)
      Wego::Client.new("search/new", search_terms).get
    end
  end
end
