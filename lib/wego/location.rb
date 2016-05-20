module Wego
  class Location
    def self.find(location, options = {})
      Wego.get_resource(
        "locations/search",
        options.merge(q: location)
      )
    end
  end
end
