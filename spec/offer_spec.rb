require 'spec_helper'

describe('User') do
  it("validates presence of offer, trade item") do
    offer = Offer.new({:trade_item => "", :description => "this is my offer"})
    expect(offer.save()).to(eq(false))
  end

  it("validates presence of offer, description") do
    offer = Offer.new({:trade_item => "apples", :description => ""})
    expect(offer.save()).to(eq(false))
  end
end
