require "spec_helper"

describe Wego::Result do
  describe ".find_by" do
    it "finds the hotel" do
      search_id = 716_073_46
      hotel_id  = 273_451

      stub_search_result_api(search_id: search_id, hotel_id: hotel_id)
      result = Wego::Result.find_by(search_id: search_id, hotel_id: hotel_id)

      expect(result.location).to eq("Sydney")
      expect(result.hotel.name).to eq("InterContinental Sydney")
      expect(result.hotel.room_rates.first.price_str).to eq("253")
      expect(result.hotel.images.count).to eq(10)
    end
  end
end
