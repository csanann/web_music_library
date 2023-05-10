#file: lib/artist_repository.rb

require_relative 'artist'
require 'csv'

class ArtistRepository
  def initialize(file_path)
    @file_path = file_path
    @artists = []
  end

  def load_data
    load_csv
  end  

  def set_album_repository(album_repository)
    @album_repository = album_repository
  end

  def all
    @artists
  end

  def find_by_id(id)
    @artists.find { |artist| artist.id == id }
  end

  def create(artist)
    max_id = @artists.map(&:id).max
    artist.id = max_id + 1
    @artists << artist
    artist.to_json
  end

  
  private

  def load_csv
    CSV.foreach(@file_path, headers: true) do |row|
      album = @album_repository.find_by_id(row['album_id'].to_i)
      artist = Artist.new(row['name'], album)
      artist.id = row['id'].to_i
      artist.name = row['name']
      artist.genre = row['genre']
      @artists << artist
    end
  end
end
