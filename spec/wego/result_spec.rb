require "spec_helper"

describe Wego::Result do
  describe ".find" do
    context "when no hotel specified" do
      it "returns search results" do
        search_id = 716_073_46
        stub_search_results_api(search_id)
        results = Wego::Result.find search_id

        expect(results.count).to eq(5)
        expect(results.hotels.first.name).to eq("Parkroyal Darling Harbour")
      end
    end

    context "when hotel_id specified" do
      it "returns one specific hotels" do
        search_id = 716_073_46
        hotel_id = 273_451
        stub_search_result_api(search_id: search_id, hotel_id: hotel_id)
        result = Wego::Result.find search_id, hotel_id: hotel_id

        expect(result.hotel.name).to eq("InterContinental Sydney")
      end
    end

    context "when customized option provided" do
      it "filters the search results" do
        search_id = 716_073_46
        options = { lang: "en", sort: "popularity" }
        stub_search_results_api(search_id, options)
        results = Wego::Result.find search_id, options

        expect(results.hotels.first.name).to eq("Parkroyal Darling Harbour")
      end
    end
  end
end
