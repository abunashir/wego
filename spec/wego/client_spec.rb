require "spec_helper"

RSpec.describe Wego, ".get_resource" do
  context "when resource exists" do
    it "submit a get request" do
      location_name = "sydney"
      stub_get_location_api(q: location_name)

      expect(
        Wego.get_resource("locations/search", q: location_name).query
      ).to eq(location_name)
    end
  end

  context "when resource does not exists" do
    it "returns nil" do
      stub_invalid_api_response(status: 404)
      expect(Wego.get_resource("invalid/resource")).to be_nil
    end
  end

  context "when user submit invalid data" do
    it "simple ignore it and returns nil" do
      stub_invalid_api_response(status: 400)
      expect(Wego.get_resource("invalid/resource")).to be_nil
    end
  end
end

RSpec.describe Wego::Client, "#url" do
  it "reutns the url with serialized params" do
    attrs = { location: "dhaka" }
    resource = Wego::Client.new("/custom", attrs)

    expect(resource.url).to include("/custom?#{wego_api_path(attrs)}")
  end

  def wego_api_path(options = {})
    params = Wego.configuration.api_keys.merge(options).compact
    params.map { |key, value| "#{key}=#{value}" }.join("&")
  end
end
