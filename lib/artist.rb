require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    #only update song's artist if not already filled
    song.artist = self if song.artist == nil
    #only update artists' songs if the song isn't yet included
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.map{|song| song.genre}.uniq
  end

end