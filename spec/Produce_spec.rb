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

  it("capitalizes the produce title") do
    produce1 = Produce.create({:produce_type => "potatoes", :description => "a".*(140), :trade => "strawberries"})
    expect(produce1.produce_type()).to(eq("Potatoes"))
  end

  describe(".findproduce") do
    it("find produce according type") do
      produce1 = Produce.create({:produce_type => "potatoes", :description => "a".*(140), :trade => "strawberries"})
      produce2 = Produce.create({:produce_type => "grape", :description => "a".*(140), :trade => "strawberries"})
      produce3 = Produce.create({:produce_type => "tomatoes", :description => "a".*(140), :trade => "strawberries"})
      expect(Produce.findproduce(potatoes)).to(eq([produce1]))
    end
  end
end
