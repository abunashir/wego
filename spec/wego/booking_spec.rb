require "spec_helper"

describe Wego::Booking do
  describe "#redirect_url" do
    it "prepares the redirect url" do
      booking_url = Wego::Booking.url_for(
        716_073_46, hotel_id: 273_451, room_rate_id: 12
      )

      expect(booking_url).to include("search/redirect/71607346?")
      expect(booking_url).to include("hotel_id=273451&room_rate_id=12")
    end
  end
end
