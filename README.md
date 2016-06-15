# Wego Hotels API

[![Build
Status](https://travis-ci.org/abunashir/wego.svg?branch=master)](https://travis-ci.org/abunashir/wego)
[![Code
Climate](https://codeclimate.com/github/abunashir/wego/badges/gpa.svg)](https://codeclimate.com/github/abunashir/wego)

The Wego Hotels API allows developers to interact with the Hotels product of
Wego.com programmatically via HTTP requests. All API methods are HTTP requests
and responses are in JSON format unless otherwise stated.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "wego", github: "abunashir/wego"
```

And then execute:

    $ bundle

## Usages

### Configure

Once you are approved and you got your API key from Wego.com, then you can add
an initializer to set your API key

```ruby
Wego.configure do |config|
  config.api_key  = "WEGO_API_KEY"
  config.api_code = "WEGO_TS_CODE"
end
```

### Locations

Use this to map user location queries to Wego location IDs. E.g. you will
probably provide your users with a text field for entering the location when
searching for hotels. The Locations API allows you to lookup text queries like
"sydney" to get a list of matching locations and their IDs.

```ruby
Wego::Location.find "sydney", options_hash
```

Complete list of options: [Wego Location API].

### Search

To perform a real-time search on Wego's partners' sites for rates in a given
location and date range, you need to pass the search terms with the user's ip.
For example: create new search for hotels in Sydney (location ID 7046)

```ruby
Wego::Search.create(
  location_id: "7046", check_in: "yyyy-mm-dd", check_out: "yyyy-mm-dd", user_ip: end_user_ip
)
```

Complete list of parameters: [Wego Search API].

### Results

Once user created a new search and they have the `search_id` then they can
retrieve that search results very easily. Wego suggests to wait at least
10 seconds after starting the search

```ruby
Wego::Result.find search_id, options_hash
```

Complete list of options: [Wego Search Results API].

### Hotel Details

Get details of a hotel, like its address, amenities, photos.

```ruby
Wego::Result.find search_id, hotel_id: hotel_id
```

Complete list of parameters: [Wego Search Result API].

### Booking

The Wego API doesn't support the shopping cart or e-commerce process either, but
using the API you can take users to continue the booking process at one of
their partners' sites.

```ruby
Wego::Booking.url_for search_id, hotel_id: hotel_id, room_rate_id: room_rate_id
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.


## Contributing

First, thank you for contributing! We love pull requests from everyone. By
participating in this project, you hereby grant the right to grant or transfer
an unlimited number of non exclusive licenses or sub-licenses to third parties,
under the copyright covering the contribution to use the contribution by all
means.

Here are a few technical guidelines to follow:

1. Open an [issue][issues] to discuss a new feature.
1. Write tests to support your new feature.
1. Make sure the entire test suite passes locally and on CI.
1. Open a Pull Request.
1. [Squash your commits][squash] after receiving feedback.
1. Party!

[issues]: https://github.com/abunashir/wego/issues
[squash]: https://github.com/thoughtbot/guides/tree/master/protocol/git#write-a-feature


## License

The gem is available as open source under the terms of
the [MIT License](http://opensource.org/licenses/MIT).

[Wego Location API]: http://support.wan.travel/hc/en-us/articles/200713154#api_locations_search
[Wego Search API]: http://support.wan.travel/hc/en-us/articles/200713154#api_search_new
[Wego Search Results API]: http://support.wan.travel/hc/en-us/articles/200713154#api_search_search_id
[Wego Search Result API]: http://support.wan.travel/hc/en-us/articles/200713154#api_show_hotel_id
