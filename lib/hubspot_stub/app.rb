# frozen_string_literal: true

require "sinatra/base"
require "sinatra/cross_origin"
require "jwt"
require "faker"

require "hubspot_stub/bootable"

module HubspotStub
  class App < Sinatra::Base
    extend Bootable

    register Sinatra::CrossOrigin

    get "/oauth/authorize" do
      erb :authorize
    end

    post "/oauth/authorize" do
      redirect "/test_page"
    end

    get "/test_page" do
      erb :test_page
    end

  end
end
