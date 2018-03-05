ENV['RACK_ENV'] = 'test'
require 'rspec' 
require 'pry'
require 'pg'
require 'User'
require 'Produce'
require 'Calendar'

RSpec.configure do |config|
  config.after(:each) do
    User.all().each() do |user|
      user.destroy()
    end
  end
    Produce.all().each() do |produce|
      produce.destroy()
    end
  end
    Calendar.all().each() do |calendar|
      calendar.destroy()
    end
  end
end
