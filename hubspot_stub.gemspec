lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hubspot_stub/version"

Gem::Specification.new do |spec| # rubocop:disable Metrics/BlockLength
  spec.name          = "hubspot_stub"
  spec.version       = HubspotStub::VERSION
  spec.authors       = ["Mike Menne"]
  spec.email         = ["hey.mike.menne@gmail.com"]

  spec.summary       = "Stub server for Hubspot."
  spec.description   = "Gem adds ability to stub requests to Hubspots, " \
                       "authentication and form APIs"
  spec.homepage      = "https://github.com/humanagencyorg/hubspot_stub"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.7"

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
          "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem
  # that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "pry", "~> 0.13"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", ">= 0.82"
  spec.add_development_dependency 'selenium-webdriver'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'cuprite'
  spec.add_development_dependency 'puma'

  spec.add_runtime_dependency "async", "~> 1.26"
  spec.add_runtime_dependency "capybara"
  spec.add_runtime_dependency "faker", "~> 2.11"
  spec.add_runtime_dependency "jwt", "~> 2.2"
  spec.add_runtime_dependency "sinatra", ">= 2.2.2"
  spec.add_runtime_dependency "sinatra-cross_origin", "~> 0.4"
  spec.add_runtime_dependency "webmock"


  spec.metadata["rubygems_mfa_required"] = "true"
end
