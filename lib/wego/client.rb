require "rest-client"
require "wego/configuration"

module Wego
  class Client
    attr_reader :end_point, :attributes

    def initialize(end_point, attributes = {})
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
      [Wego.configuration.api_host, end_point].join("/")
    end

    def api_params
      attributes.merge(
        ts_code: Wego.configuration.api_code,
        key: Wego.configuration.api_key
      )
    end

    def parse_response_to_object(response)
      JSON.parse response, object_class: OpenStruct
    end
  end

  def self.get_resource(end_point, api_params = {})
    Wego::Client.new(end_point, api_params).get
  end
end
