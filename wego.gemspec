lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wego/version"

Gem::Specification.new do |spec|
  spec.name          = "wego"
  spec.version       = Wego::VERSION
  spec.authors       = ["Abu Nashir"]
  spec.email         = ["abunashir@gmail.com"]

  spec.summary       = "Wego API wrapper in Ruby"
  spec.description   = %q{The Ruby interface to the Wego Hotels API}
  spec.homepage      = "http://www.wan.travel/api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]
  spec.test_files    = `git ls-files -- {spec}/*`.split("\n")

  spec.add_dependency "rest-client", "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.0"
  spec.add_development_dependency "pry", "~> 0.10.3"
end
