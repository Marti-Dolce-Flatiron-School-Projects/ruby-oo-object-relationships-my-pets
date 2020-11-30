# frozen_string_literal: true

require 'pry'
# Author: Martinique Dolce
# Course: Flatiron School 2020, November 9 - 20201, April 2021
# Contact: me@martidolce.com | https://modis.martidolce.com
# owner.rb
class Owner
  attr_reader :name, :species, :owner

  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
    @@count += 1
  end

  def say_species
    "I am a #{@species}."
  end

  def save
    classify.all.push(self)
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    all.find { |owner| owner.name == name }
  end

  def self.find_or_create_by_name(name)
    owner = find_by_name(name)
    owner || Owner.new(name)
  end

  # @return [Integer]
  def self.count
    @@all.count
  end

  # @return [Object]
  def self.owner_count
    @owner.each_with_object(Hash.new(0)) { |i, total| save(i, total) }
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = 'happy'
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = 'happy'
    end
  end

  def sell_pets
    pets = dogs + cats
    pets.each do |pet|
      pet.mood = 'nervous'
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def self.reset_all
    @@all.clear
  end
end
