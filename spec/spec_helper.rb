ENV["RACK_ENV"] = "test"

require "bundler/setup"
require "webmock/rspec"
require "simplecov"

SimpleCov.start do
  add_filter %r{spec}
end

require "hubspot_stub"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.after(:each) do
    HubspotStub::DB.clear_all
  end
end

project_root = File.expand_path("..", File.dirname(__FILE__))
$LOAD_PATH << project_root
Dir.glob("spec/support/**/*.rb").each { |file| require file }

# Do not announce that capybara is starting puma
Capybara.server = :puma, { Silent: true }

