require "wego/result"

module Wego
  class Search
    def self.create(search_terms)
      Wego.get_resource "search/new", search_terms
    end
  end
end
