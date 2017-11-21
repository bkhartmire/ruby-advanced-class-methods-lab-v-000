class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    result = []
    @@all.detect {|song| result << song if song.name == name}
    result[0]
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    array = filename.split(" - ")
    array[0] = song.artist_name
    song.name = array[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filname)
  end

  def self.destroy_all
    @@all.clear
  end

end
