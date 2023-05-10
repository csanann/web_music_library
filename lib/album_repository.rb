#file: lib/album_repository.rb

require_relative 'album'
require_relative 'artist_repository'
require 'csv'

class AlbumRepository
  attr_accessor :file_path, :albums

  def initialize(file_path)
    @file_path = file_path
    @albums = []
  end

  def load_data
    load_csv
  end
  

  def set_artist_repository(artist_repo)
    @artist_repository = artist_repo
  end

  def all
    @albums
  end

  def find_by_id(id)
    @albums.find { |album| album.id == id.to_i }
  end

  private

  def load_csv
    CSV.foreach(@file_path, headers: true) do |row|
      artist = @artist_repository.find_by_id(row['artist_id'].to_i)
      album = Album.new(row['title'], row['release_year'].to_i)
      album.id = row['id'].to_i 
      @albums << album
    end
  end
end
