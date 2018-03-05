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

get('/createaccount') do
  erb:createaccount
end

post('/produce') do
  produce = Produce.create({:produce_type=> params['produce_type'], :description => params['description'], :trade => params['trade'], :id => nil})
  @produce = Produce.all
  erb:available
end

post('/account') do
  user = User.create({:name=> params['name'], :password => params['password'], :quadrant => params['quadrant'], :id => nil})
  erb:index
end
