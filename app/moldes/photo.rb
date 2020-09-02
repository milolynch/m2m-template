class Photo

  attr_reader :content, :location

  def initialize(content, location)
    @content = content
    @location = location
  end

  def get_photographer
    #goal is to get all the photographer_titles who have take a photo of this content
    #select is used to get the speciic photo obj and them ve grab all the photographer_objs that
    #have a
    pho_t = Album.all.find do |album|
      album.photo.content == self.content
    end.photographer.photographer_title

    return "this photo was taken by #{pho_t}\n"
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
