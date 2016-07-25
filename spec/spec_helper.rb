require 'rspec'
require 'page-object'
require 'selenium-webdriver'
require 'watir-webdriver'

RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.before :all do
    @browser = Watir::Browser.new (ENV['DRIVER'] || 'chrome').to_sym
  end

  config.after :all do
    @browser.close
  end

end