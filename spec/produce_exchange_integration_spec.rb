require 'spec_helper'
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe "the login path", {:type => :feature} do
  it "the user starts on the home page" do
    visit '/'
    fill_in("name", :with => "kailagoff")
    fill_in("password", :with => "password")
    click_button("login-button")
    expect(page).to have_content("welcome, kailagoff")
  end
end

describe "the available produce path", {:type => :feature} do
  it "the user has logged in and clicks on available produce" do
    visit 'login'
    click_link("/produce/available")
    expect(page).to have_content("available produce")
    click_link("/produce/:id")
    expect(page).to have_content("")
  end
end

describe "the add produce path", {:type => :feature} do
  it "the user has logged in and clicks on add produce" do
    visit 'login'
    click_link("/produce/available")
    expect(page).to have_content("Add Produce")
    fill_in("produce_type", :with => "tomato")
    fill_in("description", :with => "red and juicy")
    fill_in("trade", :with => "oranges")
    fill_in("image", :with => "https://images.unsplash.com/photo-1467020323552-36f7bf0e30e6?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=531319c82648653fd61091ddd2141768&auto=format&fit=crop&w=700&q=60")
    click_button("Post Produce")
    expect(page).to have_content("tomato")
  end
end

describe "the events path", {:type => :feature} do
  it "the user has logged in and clicks on events" do
    visit 'login'
    click_link("/events")
    expect(page).to have_content("add a new event to the calendar")
    click_link("/produce/:id")
    fill_in("title", :with => "Plant Trees")
    fill_in("date", :with => "03/08/2018")
    fill_in("description", :with => "plant trees in the surrounding neighborhood")
    select "SouthEast", :from => "quadrant"
    expect(page).to have_content("Upcoming Events")
  end
end

describe "the available search path", {:type => :feature} do
  it "the user has logged in and clicks on produce and then searches produce" do
    visit '/'
    fill_in("search", :with => tomato)
    click_button("search")
    expect(page).to have_content("here are all the listings matching your search")
  end
end
