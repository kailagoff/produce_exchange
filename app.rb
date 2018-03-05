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

get('/produce') do
  erb:produce_form
end

get('/available') do
  @produce = Produce.all
  erb:available
end

post('/produce') do
  produce = Produce.create({:produce_type=> params['produce_type'], :description => params['description'], :trade => params['trade'], :id => nil})
  @produce = Produce.all
  erb:available
end
