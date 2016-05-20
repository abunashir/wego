require "spec_helper"

describe Wego::Client do
  describe ".get_resource" do
    it "submit a get request" do
      location_name = "sydney"
      stub_get_location_api(q: location_name)

      expect(
        Wego.get_resource("locations/search", q: location_name).query
      ).to eq(location_name)
    end
  end

  describe "#raw url" do
    it "reutns the url with serialized params" do
      attrs = { location: "dhaka" }
      resource = Wego::Client.new("/custom", attrs)

      expect(resource.raw_url).to include("/custom?#{wego_api_path(attrs)}")
    end
  end

  def wego_api_path(options = {})
    params = Wego.configuration.api_keys.merge(options)
    params.map { |key, value| "#{key}=#{value}" }.join("&")
  end
end
