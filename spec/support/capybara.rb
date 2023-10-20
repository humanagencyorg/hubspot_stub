require 'capybara/cuprite'

Capybara.register_driver :apparition do |app|
  Capybara::Cuprite::Driver.new(
    app,
    headless: false,
    js_errors: false,
    browser_options: {"no-sandbox": nil},
    slowmo: ENV.fetch("SLOWMO", 0),
    inspector: true
  )
end


