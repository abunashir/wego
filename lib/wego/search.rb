module Wego
  class Search
    def self.create(search_terms)
      Wego::Client.new("search/new", search_terms).get
    end
  end
end
