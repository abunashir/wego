require "spec_helper"

describe Wego::Configuration do
  after { restore_default_config }

  context "when no api host specified" do
    it "defualts to api.wego.com" do
      default_host = "http://api.wego.com/hotels/api"
      expect(Wego.configuration.api_host).to eq(default_host)
    end
  end

  context "when custom api host specified" do
    it "is used instead of default host" do
      custom_api_host = "https://custom.api.host/search"
      Wego.configure { |config| config.api_host = custom_api_host }

      expect(Wego.configuration.api_host).to eq(custom_api_host)
    end
  end

  context "when api_code specified" do
    it "is used" do
      custom_api_code = "code123456"
      Wego.configure { |config| config.api_code = custom_api_code }

      expect(Wego.configuration.api_code).to eq(custom_api_code)
    end
  end

  context "when api_key specified" do
    it "is used" do
      custom_api_key = "key123456"
      Wego.configure { |config| config.api_key = custom_api_key }

      expect(Wego.configuration.api_key).to eq(custom_api_key)
    end
  end

  describe "#api_keys" do
    it "returns the api keys in required format" do
      Wego.configure do |config|
        config.api_key = "custom_api_key"
        config.api_code = "custom_api_code"
      end

      expect(
        Wego.configuration.api_keys
      ).to eq(ts_code: "custom_api_code", key: "custom_api_key")
    end
  end
end
