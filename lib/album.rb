#file: lib/albums.rb

class Album
    attr_accessor :id, :title, :release_year, :artist_id
  
  
    def initialize(title = nil, release_year = nil, artist_id = nil)
      @title = title
      @release_year = release_year
      @artist_id = artist_id
    end
  end
