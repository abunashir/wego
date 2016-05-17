require "webmock/rspec"
require "dotenv"
Dotenv.load

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "wego"

Dir["./spec/support/**/*.rb"].sort.each { |file| require file }

RSpec.configure do |config|
  config.include FakeWegoApi
end
