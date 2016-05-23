require "spec_helper"

describe Wego::Search do
  describe ".create" do
    it "create new search" do
      search_terms = {
        location_id: "7046",
        check_in: "2016-05-20",
        check_out: "2016-05-25",
        user_ip: "127.0.0.1",
        rooms: 1,
        guests: 2
      }

      stub_new_search_api(search_terms)
      search = Wego::Search.create(search_terms)

      expect(search.search_id).not_to be_nil
      expect(search.is_done).to be_falsey
      expect(search.created_at).not_to be_nil
    end

    context "when date time provided" do
      it "formats as required" do
        stub_new_search_api(
          location_id: "7046", check_in: "2016-05-23",
          check_out: "2016-05-28", user_ip: "127.0.0.1"
        )

        search = Wego::Search.create(
          location_id: "7046", check_in: "2016-05-23 15:05:21 UTC",
          check_out: "28 May 2016, 15:05:21 UTC", user_ip: "127.0.0.1"
        )

        expect(search).not_to be_nil
        expect(search.is_done).to be_falsey
      end
    end
  end
end
