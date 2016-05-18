module Wego
  class Configuration
    attr_accessor :api_host
    attr_accessor :api_key
    attr_accessor :api_code

    def initialize
      @api_host = "http://api.wego.com/hotels/api"
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end
end
