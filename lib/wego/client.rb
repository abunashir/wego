require "rest-client"

module Wego
  class Client
    attr_reader :end_point, :attributes

    def initialize(end_point, attributes)
      @end_point = end_point
      @attributes = attributes
    end

    def get
      parse_response_to_object(
        RestClient.get(api_path, params: api_params)
      )
    end

    private

    def api_path
      ["http://api.wego.com/hotels/api", end_point].join("/")
    end

    def api_params
      attributes.merge(ts_code: ENV["WAN_API_CODE"], key: ENV["WAN_API_KEY"])
    end

    def parse_response_to_object(response)
      JSON.parse response, object_class: OpenStruct
    end
  end
end
