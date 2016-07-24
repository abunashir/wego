require "wego/result"

module Wego
  class Search
    def self.create(location_id:, check_in:, check_out:, user_ip:, **options)
      Wego.get_resource(
        "search/new",
        location_id: location_id,
        check_in: Wego.format_date(check_in),
        check_out: Wego.format_date(check_out),
        user_ip: user_ip,
        **options
      )
    end
  end

  def self.format_date(date)
    DateTime.parse(date).strftime("%Y-%m-%d")
  end
end
