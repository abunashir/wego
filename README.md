# Wego Hotels API

[![Build
Status](https://travis-ci.org/abunashir/wego.svg?branch=master)](https://travis-ci.org/abunashir/wego)
[![Code
Climate](https://codeclimate.com/github/abunashir/wego/badges/gpa.svg)](https://codeclimate.com/github/abunashir/wego)

The Wego Hotels API allows developers to interact with the Hotels product of
Wego.com programmatically via HTTP requests. This is the interface to the Wego
Hotels API and responses are parsed to `OpenStruct` object.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "wego", github: "abunashir/wego"
```

And then execute:

```sh
$ bundle install
```

## Configure

Once you are approved and you got your API key from Wego.com, then you can add
an initializer to set your API key

```ruby
Wego.configure do |config|
  config.api_key  = "WEGO_API_KEY"
  config.api_code = "WEGO_TS_CODE"
end
```

## Usages

### Locations

Use this to map user location queries to Wego location IDs. E.g. you will
probably provide your users with a text field for entering the location when
searching for hotels. The Locations API allows you to lookup text queries like
"sydney" to get a list of matching locations and their IDs.

```ruby
Wego::Location.find(
  "sydney", lang: "en", page: 1, per_page: 10
)
```

Complete list of options: [Wego Location API].

### Search

To perform a real-time search on Wego's partners' sites for rates in a given
location and date range, you need to pass the search terms with the user's ip.
For example: create new search for hotels in Sydney (location ID 7046)

```ruby
Wego::Search.create(
  location_id: "7046",
  rooms: 1,
  guests: 2,
  check_in: "2016-07-15",
  check_out: "2016-07-20",
  user_ip: end_user_ip
)
```

Complete list of parameters: [Wego Search API].

### Results

Once user created a new search and they have the `search_id` then they can
retrieve that search results very easily. Wego suggests to wait at least
10 seconds after starting the search

```ruby
Wego::Result.find(
  search_id,
  lang: "en",
  page: 1,
  per_page: 20,
  order: "asc",
  sort: "popularity",
  currency_code: "USD"
)
```

Complete list of options: [Wego Search Results API].

### Hotel Details

Get details of a hotel, like its address, amenities, photos.

```ruby
Wego::Result.find(
  search_id, hotel_id: hotel_id, lang: "en", currency: "USD"
)
```

Complete list of parameters: [Wego Search Result API].

### Booking

The Wego API doesn't support the shopping cart or e-commerce process either, but
using the API you can take users to continue the booking process at one of
their partners' sites.

```ruby
Wego::Booking.url_for(
  search_id, hotel_id: hotel_id, room_rate_id: room_rate_id
)
```

## Development

We are following Sandi Metz's Rules for this gem, you can read the
[description of the rules here]
(http://robots.thoughtbot.com/post/50655960596/sandi-metz-rules-for-developers). All new code should follow these rules. If you make changes in a pre-existing
file that violates these rules you should fix the violations as part of
your contribution.

### Setup

* Clone the repository.

```sh
git clone https://github.com/abunashir/wego.git
```

* Setup your environment.

```sh
bin/setup
```

* Run the test suite

```sh
bin/rake
```

### PlayBox

* Setup API keys.

```sh
cp .sample.pryrc .pryrc
vim .pryrc
```

* Start your console.

```sh
bin/console
```

* Start playing with it.

```sh
Wego::Location.find "sydney"
```

## Testing

### RSpec

This gem provides an easier way to test Wego API Responses. Simply include the
following line in your `spec_helper` and you should have access to all of the
test helpers.

```ruby
require "wego/rspec"
```

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
