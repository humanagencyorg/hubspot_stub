require 'spec_helper'
require 'capybara/rspec'
require 'capybara/cuprite'

RSpec.describe 'Authorize with Hubspot', type: :feature, js: true do
  before do
    Capybara.app = HubspotStub::App
    Capybara.current_driver = :apparition
    Capybara.default_max_wait_time = 3
    WebMock.disable_net_connect!(allow_localhost: true)
  end

  context "when authorizing with Hubpsot" do
    it 'you are redirected to the url you provided' do
      visit '/oauth/authorize'
      choose 'Account 1'
      click_on 'Authorize'

      expect(page).to have_content '🎉 You are authorized! 🎉'
    end
  end
end

