require("sinatra")
require("sinatra/reloader")
require "active_record"
require "sinatra/activerecord"
also_reload("lib/**/*.rb")
require("./lib/User")
require("./lib/Produce")
require("./lib/event")
require("pg")
require("pry")


get('/') do
  erb :home
end

#event
get('/events/new') do
  erb :event_form
end

get('/events') do
  @events = Event.all()
end

post('/') do
  name = params.fetch('name')
  date = params.fetch('date')
  description = params.fetch('description')
  quadrant = params.fetch('quadrant')
  event = Event.create({:name => name, :date => date, :description => description, :quadrant => quadrant, :id => nil})
  redirect '/events'
end
