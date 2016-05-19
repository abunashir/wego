module Wego
  class Location
    def self.find(location)
      Wego.get_resource "locations/search", q: location
    end
  end
end
