require_relative "./spec_helper"

require "hubspot_stub/app"
require "hubspot_stub/db"

RSpec.describe HubspotStub do
  describe ".boot" do
    it "calls App.boot_once" do
      allow(HubspotStub::App).to receive(:boot_once)

      described_class.boot

      expect(HubspotStub::App).to have_received(:boot_once)
    end
  end

  describe ".stub_requests" do
    it "calls webmock to stub api.hubapi.com requests" do
      webmock = class_double(WebMock::API).as_stubbed_const
      webmock_instance = double("WebMock::API instance")

      allow(webmock).
        to receive(:stub_request).
        and_return(webmock_instance)
      allow(webmock_instance).
        to receive(:to_rack).
        with(HubspotStub::App)

      described_class.stub_requests

      expect(webmock_instance).
        to have_received(:to_rack).
        with(HubspotStub::App)
    end

    it "calls webmock to stub api.hsforms.com requests" do
      webmock = class_double(WebMock::API).as_stubbed_const
      webmock_instance = double("WebMock::API instance")

      allow(webmock).
        to receive(:stub_request).
        and_return(webmock_instance)
      allow(webmock_instance).
        to receive(:to_rack).
        with(HubspotStub::App)

      described_class.stub_requests

      expect(webmock_instance).
        to have_received(:to_rack).
        with(HubspotStub::App)
    end
  end

  describe ".clear_store" do
    it "calls DB to clear it" do
      allow(HubspotStub::DB).to receive(:clear_all)

      described_class.clear_store

      expect(HubspotStub::DB).to have_received(:clear_all)
    end
  end
end
