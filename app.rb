require("sinatra")
require("sinatra/reloader")
require "active_record"
require "sinatra/activerecord"
also_reload("lib/**/*.rb")
require("./lib/user")
require("./lib/produce")
require("./lib/event")
require("pg")
require("pry")

enable :sessions

get('/') do
  erb :index
end

#produce
get('/produce') do
  erb :"produce/produce_form"
end

get('/available') do
  @produce = Produce.all
  erb :"produce/available"
end

get('/createaccount') do
  erb :"account/account_form"
end

get('/login') do #added this
  erb :"account/login_form"
end

get '/logout' do #added, doesnt work?
  session.clear
end

post('/produce') do
  produce = Produce.create({:produce_type=> params['produce_type'], :description => params['description'], :trade => params['trade'], :id => nil})
  @produce = Produce.all
  session[:id] = @user.id #changed this
  erb :"produce/available"
end

post('/account_success') do #added all of this
  @user = User.create({:name=> params['name'], :password => params['password'], :quadrant => params['quadrant'], :id => nil})
  session[:id] = @user.id
  erb :"/account/account_success"
end

post('/login_success') do #this too
  @user = User.find_by(name: params["name"], password: params["password"])
  session[:id] = @user.id
  erb :"account/login_success" #and a file, in accounts, two files
end

post('/users') do
  user = User.create({:name=> params['name'], :password => params['password'], :quadrant => params['quadrant'], :id => nil})
  @users = User.all()
  erb :"account/accounts"
end

get('/users') do
  @users = User.all()
  erb :"account/accounts"
end

get('/users/:id') do
  @user = User.find(params.fetch("id").to_i())
  erb :"account/account_info"
end

get('/users/:id/edit') do
  @user = User.find(params.fetch("id").to_i())
  erb :"account/edit_account"
end

patch('/users/:id') do
  name = params['name']
  @user = User.find(params.fetch("id").to_i())
  @user.update({:name => name})
  erb :"account/account_info"
end

delete('/users/:id') do
  @user = User.find(params.fetch("id").to_i())
  @user.delete()
  @user = User.all()
  redirect '/users'
end

#event
get('/events/new') do
  erb :"event/event_form"
end

get('/events') do
  @events = Event.all()
  erb :"event/events"
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
  erb :"event/event_info"
end

post('/events/:id')do
  @event = Event.find(params.fetch("id").to_i())
  found_user = User.find(params.fetch("user_id").to_i())
  @event.users.push(found_user)
  @available_users = User.all() - @event.users
  erb :"event/event_info"
end

get('/events/:id/edit') do
  @event = Event.find(params.fetch("id").to_i())
  erb :"event/edit_event"
end

patch('/events/:id') do
  title = params['title']
  date = params['date']
  @event = Event.find(params.fetch("id").to_i())
  @event.update({:title => title, :date => date})
  @available_users = User.all() - @event.users
  erb :"event/event_info"
end

delete('/events/:id') do
  @event = Event.find(params.fetch("id").to_i())
  @event.delete()
  @events = Event.all()
  redirect '/events'
end
