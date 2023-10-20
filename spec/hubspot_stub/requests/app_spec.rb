require "jwt"
require "rack/test"
require "spec_helper"

RSpec.describe HubspotStub::App do
  module RSpecMixin # rubocop:disable Lint/ConstantDefinitionInBlock
    include Rack::Test::Methods

    def app
      described_class
    end
  end

  before do
    HubspotStub.clear_store

    RSpec.configure do |c|
      c.include RSpecMixin
    end
  end

  describe "GET /oauth/authorize" do
    it "returns status 200" do
      get "/oauth/authorize"

      expect(last_response.status).to eq(200)
    end

    it "returns a form to select account" do
      get "/oauth/authorize"

      expect(last_response.body).to include("Select an account")
    end
  end



end
