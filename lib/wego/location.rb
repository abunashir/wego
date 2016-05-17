module Wego
  class Location
    def self.find(location)
      Wego::Client.new("locations/search", q: location).get
    end
  end
end
