class Photo

  attr_reader :content, :location

  def initialize(content, location)
    @content = content
    @location = location
  end

  def get_photographers

    #goal is to get all the photographer_titles who have take a photo of this content
    Album.all.select do |album|
      album.photo == self
    end

  end




end



class Album


  @@all_albums = []

  attr_reader :photo, :photographer

  def initialize(photo_obj, photographer_obj)

    @photo = photo_obj
    @photographer = photographer_obj
    @@all_albums << self


  end

  def self.all
    @@all_albums
  end

end
