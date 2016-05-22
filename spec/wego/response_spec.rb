require "spec_helper"

describe Wego::Response do
  describe ".parse_json" do
    it "parses json response" do
      content = File.read "./spec/fixtures/locations.json"
      response = Wego::Response.parse_json(content)

      expect(response.count).to eq(3)
      expect(response.class).to be Wego::OpenStruct
    end
  end
end
