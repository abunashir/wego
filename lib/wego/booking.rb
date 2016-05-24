module Wego
  class Booking
    def self.url_for(search_id, hotel_id:, room_rate_id:)
      Wego::Client.new(
        "search/redirect/#{search_id}",
        hotel_id: hotel_id,
        room_rate_id: room_rate_id
      ).url
    end
  end
end
