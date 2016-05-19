require "spec_helper"

describe Wego::Booking do
  describe "#redirect_url" do
    it "prepares the redirect url" do
      booking = Wego::Booking.new(
        search_id: 716_073_46,
        hotel_id: 273_451,
        room_rate_id: 12
      )

      expect(booking.redirect_url).to include("search/redirect/71607346?")
      expect(booking.redirect_url).to include("hotel_id=273451&room_rate_id=12")
    end
  end
end
