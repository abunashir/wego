require "rest-client"
require "wego/response"
require "wego/configuration"

module Wego
  class Client
    attr_reader :end_point, :attributes

    def initialize(end_point, attributes = {})
      @end_point = end_point
      @attributes = attributes
    end

    def get
      RestClient.get api_path, params: api_params
    end

    def url
      params = api_params.map { |key, value| "#{key}=#{value}" }.join("&")
      [api_path, params].join("?")
    end

    private

    def api_path
      [Wego.configuration.api_host, end_point].join("/")
    end

    def api_params
      Wego.configuration.api_keys.merge attributes
    end
  end

  def self.get_resource(end_point, api_params = {})
    Wego::Response.parse_json(
      Client.new(end_point, api_params).get
    )
  rescue RestClient::ResourceNotFound, RestClient::BadRequest
  end
end
