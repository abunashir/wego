require "wego/result"

module Wego
  class Search
    def self.create(search_terms)
      search_terms[:check_in] = Wego.format_date(search_terms[:check_in])
      search_terms[:check_out] = Wego.format_date(search_terms[:check_out])

      Wego.get_resource "search/new", search_terms
    end
  end

  def self.format_date(date)
    DateTime.parse(date).strftime("%Y-%m-%d")
  end
end
