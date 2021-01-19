require 'pry'

class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end

  def files
    all_files = Dir.entries(@path)

    mp3_files = []
    mp3_files = all_files.each{|file| mp3_files << file if file.match(/.+(.mp3)/)}
    # binding.pry
  end
end