# frozen_string_literal: true

require 'pry'
# Author: Martinique Dolce
# Course: Flatiron School 2020, November 9 - 20201, April 2021
# Contact: me@martidolce.com | https://modis.martidolce.com
# cat.rb
class Dog
  # code goes here
  attr_accessor :mood, :owner
  attr_reader :name

  @@all = []

  def initialize(name, owner)
    @name = name
    @mood = 'nervous'
    @owner = owner
    @@all << self
  end

  def self.all
    @@all
  end
end