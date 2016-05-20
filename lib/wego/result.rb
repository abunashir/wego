module Wego
  class Result
    def self.find(search_id, options = {})
      Wego.get_resource "search/#{search_id}", options
    end
  end
end
