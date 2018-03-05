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

enable :sessions

get('/') do
  erb:index
end

get('/produce') do
  erb:produce_form
end

get('/produce/:id') do
  @produce = Produce.find(params['id'])
  erb:produceinfo
end

get('/available') do
  @produce = Produce.all
  erb:available
end

get('/signup') do
  erb:signup
end

get('/users/index') do
  @users = User.find(session[:id])
  erb:'/users/index'
end

post('/produce') do
  produce = Produce.create({:produce_type=> params['produce_type'], :description => params['description'], :trade => params['trade'], :id => nil})
  @produce = Produce.all
  erb:available
end

post('/account') do
  @user = User.create({:name=> params['name'], :password => params['password'], :quadrant => params['quadrant'], :id => nil})
  session[:id] = @user.id
  redirect 'users/index'
end

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
  erb'/events'
end

get('/events/:id') do
  @event = Event.find(params.fetch("id").to_i())
  @available_users = User.all() - @event.users
  erb :event_info
end
