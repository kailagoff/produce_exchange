require 'spec_helper'

describe('Produce') do
  it("validates presence of produce type") do
    produce1 = Produce.new({:produce_type => "", :description => "fasdfadf", :trade => "strawberries"})
    expect(produce1.save()).to(eq(false))
  end

  it("validates presence of description") do
    produce1 = Produce.new({:produce_type => "bananas", :description => "", :trade => "blueberries"})
    expect(produce1.save()).to(eq(false))
  end

  it("validates presence of trade") do
    produce1 = Produce.new({:produce_type => "tomatoes", :description => "asdfdasf", :trade => ""})
    expect(produce1.save()).to(eq(false))
  end

  it("validates length of description is less than 150 characters") do
    produce1 = Produce.new({:produce_type => "potatoes", :description => "a".*(151), :trade => "strawberries"})
    expect(produce1.save()).to(eq(false))
  end
end
