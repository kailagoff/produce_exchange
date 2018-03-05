require("sinatra")
require("sinatra/reloader")
require "active_record"
require "sinatra/activerecord"
also_reload("lib/**/*.rb")
require("./lib/User")
require("./lib/Produce")
require("./lib/Calendar")
require("pg")
require("pry")


get('/') do
  erb:index
end

post('/') do
  erb:index
end
