ENV['RACK_ENV'] = 'test'
require 'rspec'
require 'pry'
require 'pg'
require("sinatra/activerecord")
require 'user'
require 'produce'
require 'event'

RSpec.configure do |config|
  config.after(:each) do
    User.all().each() do |users|
      users.destroy()
    end
  end
    Produce.all().each() do |produces|
      produces.destroy()
    end
    Event.all().each() do |events|
      events.destroy()
    end
end
