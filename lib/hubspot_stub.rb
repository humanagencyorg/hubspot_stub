require "hubspot_stub/version"
require "hubspot_stub/app"
require "hubspot_stub/db"
require "webmock"
require "faker"

module HubspotStub
  class Error < StandardError; end

  DB = Db.instance

  def self.boot
    App.boot_once
  end

  def self.hubspot__host
    "http://localhost:#{App.port}"
  end

  def self.stub_requests
    WebMock::API.
      stub_request(:any, /api\.(hubapi\.com|hsforms\.com)/).
      to_rack(App)
  end

  def self.clear_store
    DB.clear_all
  end
end
