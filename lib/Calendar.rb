#!/usr/bin/env ruby
class Calendar < ActiveRecord::Base
  has_and_belongs_to_many(:produce)
end
