#file: lib/albums_repo.rb
require 'albums'
require_relative 'database_connection'

class AlbumsRepository
    # Selecting all records
    # No arguments
  def all
    albums = []
      # Executes the SQL query:
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

      result_set.each do |record|
        album = Albums.new
        
        album.id = record['id']
        album.title = record['title']
        album.release_year = record['release_year']
        album.artist_id = record['artist_id']

        albums << album
      end
     # Returns an array of Album objects.
      return albums
  end

  def find(id)
    sql = 'SELECT * FROM albums WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)

    row = result.first
    Albums.new(row['id'], row['title'], row['artist'])
  end
end