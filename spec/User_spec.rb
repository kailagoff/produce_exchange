require 'spec_helper'

describe('User') do
  it("Searches by name") do
    user1 = User.create({:name => "Emily", :password => "ewiru", :id => nil})
    user2 = User.create({:name => "Ron", :password => "riotfdlkg", :id => nil})
    expect(User.findbyname("Emily")).to(eq(user1.id))
  end

  it("validates presence of User name") do
    user = User.new({:name => "", :password => "asdas"})
    expect(user.save()).to(eq(false))
  end

  it("validates presence of password") do
    user = User.new({:name => "a".*(16), :password => ""})
    expect(user.save()).to(eq(false))
  end

  it("validates length of user name is less than 20 characters") do
    user = User.new({:name => "a".*(21), :password => "sefafa"})
    expect(user.save()).to(eq(false))
  end

  it("tests for user name uniqueness") do
    user = User.create({:name => "Emily", :password => "sefafa"})
    user2 = User.new({:name => "Emily", :password => "faefasd"})
    expect(user2.save()).to(eq(false))
  end

end
