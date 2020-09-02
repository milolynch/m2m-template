require 'pry'
require_relative 'photo.rb'
class Photographer

  attr_accessor :experience, :camera
  attr_reader :name

  def initialize(name)
    @name = name
    @experience = 2
  end

  # makes Photographer the 'top' class where this class calles the other classes to create functionality
  def take_photo(content, location)
    temp = Photo.new(content, location)
    Album.new(temp, self)
    self.experience+=1
    return temp
  end

  def photographer_title
    # return experience as begginer(2-4), jornman, photomaster or jimmy
    if self.experience < 4
      return "the photographer #{self.name} who is a begginer with #{self.experience} years of experience"
    elsif self.experience.between?(4,6)
      return "the photographer #{self.name} who is a instagramer with #{self.experience} years of experience"
    elsif self.experience.between?(7,10)
      return "the photographer #{self.name} who is a photomaster with #{self.experience} years of experience"
    else
      return "They are JIMMEY!!"
    end
  end

  def num_photos
    Album.all.select do |album|
      self.name == album.photographer.name
    end.size
  end

end


milo = Photographer.new("milo")
hyrum = Photographer.new("hyrum")
milo.experience=6

sunset = milo.take_photo("sunset","California")
dog = hyrum.take_photo("dog","California")
photo3 = milo.take_photo("friends","California")
puts sunset.get_photographer
puts dog.get_photographer
#milo.camera= "iphone"
#p milo.camera
#puts milo.experience
#print Album.all
#puts milo.photographer_title
#puts milo.num_photos
