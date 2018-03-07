require("sinatra")
require("sinatra/reloader")
require "active_record"
require "sinatra/activerecord"
also_reload("lib/**/*.rb")
require("./lib/user")
require("./lib/produce")
require("./lib/event")
require("./lib/offer")
require("pg")
require("pry")

enable :sessions

#home/login
get('/') do
  erb :index
end

get('/login') do #added this
  erb :"account/login_form"
end

post('/login') do #this too
  @user = User.find_by(name: params["name"], password: params["password"])
    if @user == nil
      @error_message = "That user name does not match any current user names. Please try again."
      erb :"account/login_form"
    else
  session[:id] = @user.id
  erb :"home"
  end
end

get('/createaccount') do
  erb :"account/account_form"
end

post('/account') do #added all of this
  @user = User.create({:name=> params['name'], :password => params['password'], :quadrant => params['quadrant'], :id => nil})
  session[:id] = @user.id
  erb :"home"
end

get '/logout' do
  session.clear
  erb :"index"
end

#produce
post('/search')do
  @produce_type = params.fetch("produce_type")
  @produce = Produce.findproduce(@produce_type)
  erb :"produce/search"
end

get('/produce') do
  erb :"produce/produce_form"
end

get('/produce') do
  erb :"produce/produce_form"
end

get('/produce/available') do
  @produce = Produce.all
  erb :"produce/available"
end

post('/produce/available') do
  @user_id = User.findbyname(params.fetch("name"))
  produce = Produce.create({:produce_type=> params['produce_type'], :description => params['description'], :trade => params['trade'], :user_id => @user_id, :image => params['image']})
  @produce = Produce.all
  # session[:id] = @user.id #changed this
  if params[:image] != nil
    url = params[:image]
    produce.add_image(url)
  end
  erb :"produce/available"
end

get('/produce/:id') do
  @offers = Offer.all
  @produce = Produce.find(params.fetch("id").to_i())
  @id = @produce.user_id.to_i()
  @found_user = User.find(@id)
  @session_id = session[:id]
  @logged_user = User.find(@session_id)
  erb :"produce/produce_info"
end

post('/produce/:id/offer') do
  @user_id = session[:id]
  @produce = Produce.find(params.fetch("id").to_i())
  @offer = Offer.create({:trade_item => params['trade_item'], :description => params['description'], :produce_id => params['produce_id'], :user_id => @user_id})
  @produce.offers.push(@offer)
  @offers = Offer.all
  @id = @produce.user_id.to_i()
  @found_user = User.find(@id)
  erb :"produce/produce_info"
end

get('/produce/:id/edit') do
  @produce = Produce.find(params.fetch("id").to_i())
  erb :"produce/edit_produce"
end

patch('/produce/:id') do
  produce_type = params['produce_type']
  description = params['description']
  trade = params['trade']
  @user = User.find(params.fetch("id").to_i())
  @produce = Produce.find(params.fetch("id").to_i())
  @produce.update({:produce_type => produce_type})
  erb :"produce/produce_info"
end

delete('/produce/:id') do
  @produce = Produce.find(params.fetch("id").to_i())
  @produce.delete()
  redirect '/produce/available'
end

#user
post('/users') do
  @user = User.create({:name=> params['name'], :password => params['password'], :quadrant => params['quadrant'], :profile => params['profile'], :id => nil})
  @users = User.all()
  erb :"account/accounts"
end

get('/users') do
  @users = User.all()
  erb :"account/accounts"
end

get('/users/:id') do
  @user = User.find(params.fetch("id").to_i())
  @produce = Produce.find(params.fetch("id").to_i())
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
  @user.produces.clear
  @user.delete()
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
  erb :"event/event_info"
end

post('/events/:id')do
  @event = Event.find(params.fetch("id").to_i())
  @user_id = User.findbyname(params.fetch("name"))
  found_user = User.find(@user_id)
  @event.users.push(found_user)
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
  erb :"event/event_info"
end

delete('/events/:id') do
  @event = Event.find(params.fetch("id").to_i())
  @event.delete()
  @events = Event.all()
  redirect '/events'
end

## instagram api
