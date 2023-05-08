
# lib/artist_repository.rb

require_relative 'artist'
require 'artists_list.csv'

class ArtistRepository
  def initialize(file_path)
    @file_path = 'data/artists_list.csv'
  end

  def all
    artists = []

    CSV.foreach(@file_path, headers: true) do |row|
      artist = Artist.new
      artist.id = row['id'].to_i
      artist.name = row['name']
      artist.genre = row['genre']
      artists << artist
    end

    artists
  end

  def find(id)
    CSV.foreach(@file_path, headers: true) do |row|
      if row['id'].to_i == id
        artist = Artist.new
        artist.id = row['id'].to_i
        artist.name = row['name']
        artist.genre = row['genre']
        return artist
      end
    end

    nil
  end
end
