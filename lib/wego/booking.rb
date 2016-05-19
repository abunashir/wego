module Wego
  class Booking
    attr_reader :search_id, :hotel_id, :room_rate_id

    def initialize(attrs)
      @search_id  = attrs[:search_id]
      @hotel_id   = attrs[:hotel_id]
      @room_rate_id = attrs[:room_rate_id]
    end

    def redirect_url
      resource.raw_url
    end

    private

    def resource
      @resource ||= Wego::Client.new(
        "search/redirect/#{search_id}",
        hotel_id: hotel_id,
        room_rate_id: room_rate_id
      )
    end
  end
end
