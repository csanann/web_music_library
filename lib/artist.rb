#file: lib/artist.rb

class Artist
    attr_accessor :id, :name, :genre, :albums
 
    def initialize(name = nil, genre = nil, id = nil)
      @name = name
      @genre = genre
      @id = nil
      @albums = []
    end
  end
  