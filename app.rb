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
  erb:index
end

#produce
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

post('/accounts') do
  user = User.create({:name=> params['name'], :password => params['password'], :quadrant => params['quadrant'], :id => nil})
  @users = User.all()
  erb :accounts
end

get('/accounts') do
  @users = User.all()
  erb :accounts
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
  title = params['title']
  date = params['date']
  description = params['description']
  quadrant = params['quadrant']
  event = Event.create({:title => title, :date => date, :description => description, :quadrant => quadrant, :id => nil})
  redirect '/events'
end

get('/events/:id') do
  @event = Event.find(params.fetch("id").to_i())
  @available_users = User.all() - @event.users
  erb :event_info
end

post('/events/:id')do
  @event = Event.find(params.fetch("id").to_i())
  found_user = User.find(params.fetch("user_id").to_i())
  @event.users.push(found_user)
  @available_users = User.all() - @event.users
  erb :event_info
end
