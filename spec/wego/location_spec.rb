require "spec_helper"

describe Wego::Location do
  it "retrive locations" do
    location_name = "sydney"
    stub_get_location_api(location: location_name)
    location = Wego::Location.find(location_name)

    expect(location.count).to eq(3)
    expect(location.query).to eq(location_name)
    expect(location.locations.first.country_name).to eq("Australia")
  end
end
