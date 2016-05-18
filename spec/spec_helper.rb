require "webmock/rspec"
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "wego"

Dir["./spec/support/**/*.rb"].sort.each { |file| require file }

RSpec.configure do |config|
  config.include FakeWegoApi

  config.before :suite do
    Wego.configure do |wego_config|
      wego_config.api_key  = "WEGO_API_KEY"
      wego_config.api_code = "WEGO_API_CODE"
    end
  end
end

def restore_default_config
  Wego.configuration = nil
  Wego.configure {}
end
