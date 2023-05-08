#file: lib/album_repository.rb

require_relative 'album'
require_relative 'artist_repository'
require 'csv'

class AlbumRepository
  def initialize(file_path, artist_repository)
    @file_path = 'data/albums_list.csv'
    @artist_repository = artist_repository
  end

  def all
    albums = []

    CSV.foreach(@file_path, headers: true) do |row|
      artist = @artist_repository.find(row['artist_id'].to_i)

      album = Album.new
      album.id = row['id'].to_i
      album.title = row['title']
      album.artist = artist
      albums << album
    end

    albums
  end

  def find(id)
    CSV.foreach(@file_path, headers: true) do |row|
      if row['id'].to_i == id
        artist = @artist_repository.find(row['artist_id'].to_i)

        album = Album.new
        album.id = row['id'].to_i
        album.title = row['title']
        album.artist = artist
        return album
      end
    end

    nil
  end
end
