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
  erb(:events)
end

post('/events') do
  name = params.fetch('name')
  date = params.fetch('date')
  description = params.fetch('description')
  quadrant = params.fetch('quadrant')
  @event = Event.create({:name => name, :date => date, :description => description, :quadrant => quadrant, :id => nil})
  erb(:events)
end

get('/events/:id') do
  @event = Event.find(params.fetch("id").to_i())
  @available_users = User.all() - @event.users
  erb :event_info
end
