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
Wego::Location.find "sydney"
```

### Search

To perform a real-time search on Wego's partners' sites for rates in a given
location and date range, you need to pass the search terms with the user's ip.
For example: create new search for hotels in Sydney (location ID 7046)

```ruby
Wego::Search.create(
  location_id: "7046",
  check_in: "2016-05-20",
  check_out: "2016-05-25",
  user_ip: "127.0.0.1"
)
```

### Results

Once user created a new search and they have the `search_id` then they can
retrieve that search results very easily. Wego suggests to wait at least
10 seconds after starting the search

```ruby
Wego::Search.find(search_id).results
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.


## Contributing

Bug reports and pull requests are welcome on
GitHub at https://github.com/[USERNAME]/wego. This project is intended to be
a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code
of conduct.


## License

The gem is available as open source under the terms of
the [MIT License](http://opensource.org/licenses/MIT).
