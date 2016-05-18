require "spec_helper"

describe Wego::Search do
  it "create new search" do
    search_terms = {
      location_id: "7046",
      check_in: "2016-05-20",
      check_out: "2016-05-25",
      user_ip: "127.0.0.1"
    }

    stub_new_search_api(search_terms)
    search = Wego::Search.create(search_terms)

    expect(search.search_id).not_to be_nil
    expect(search.is_done).to be_falsey
    expect(search.created_at).not_to be_nil
  end

  describe "#results" do
    it "returns search results" do
      search_id = 715_374_75
      stub_search_results_api(search_id)
      results = Wego::Search.find(search_id).results

      expect(results.location).to eq("Sydney")
      expect(results.count).to eq(5)
      expect(results.hotels.first.name).to eq("Parkroyal Darling Harbour")
    end
  end
end
