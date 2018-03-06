require 'spec_helper'

describe('User') do
  it("Searches by name") do
    user1 = User.create({:name => "Emily", :password => "ewiru", :id => nil})
    user2 = User.create({:name => "Ron", :password => "riotfdlkg", :id => nil})
    expect(User.findbyname("Emily")).to(eq(user1.id))
  end
end
