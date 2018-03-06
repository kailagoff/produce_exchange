require 'spec_helper'

describe('Event') do
  it("validates presence of event title") do
    event1 = Event.new({:title => "", :date => "2018-04-22", :description => "fasdfadf", :quadrant => "Northwest"})
    expect(event1.save()).to(eq(false))
  end

  it("validates presence of description") do
    event1 = Event.new({:title => "Jarring workshop", :date => "2018-04-22", :description => "", :quadrant => "Northwest"})
    expect(event1.save()).to(eq(false))
  end

  it("validates length of description is less than 150 characters") do
    event1 = Event.new({:title => "Jarring workshop", :date => "2018-04-22", :description => "a".*(151), :quadrant => "Northwest"})
    expect(event1.save()).to(eq(false))
  end

  # it("tests if the event date is in the future") do
  #   event1 = Event.new({:title => "Jarring workshop", :date => "2017-12-15", :description => "a".*(141), :quadrant => "Northwest"})
  #   expect(event1.save()).to(eq(false))
  # end
end
