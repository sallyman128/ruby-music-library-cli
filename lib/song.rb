class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song = self.create(name) if song == nil
    song
  end

  ## Instance Methods

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  #custom @artist setter to sync with Artist class
  def artist= (artist)
    @artist = artist
    artist.add_song(self) if artist != nil
  end

  #custom @genre setter to sync with Genre class
  def genre= (genre)
    @genre = genre
    if genre != nil
      genre.songs << self unless genre.songs.include?(self)
    end
  end

  def save
    @@all << self
  end

end