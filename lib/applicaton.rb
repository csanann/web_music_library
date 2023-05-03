#file: lib/application.rb

require_relative './database_connection'

class Application
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    @io.puts 'Welcome to the music library manager!'

    loop do
      @io.puts 'What would you like to do?'
      @io.puts ' 1 - List all albums'
      @io.puts ' 2 - List all artists'
      @io.puts
      @io.puts 'Enter your choice:'

      choice = @io.gets.chomp.to_i
      @io.puts

      case choice
      when 1
        list_albums
      when 2
        list_artists
      else
        @io.puts 'Invalid choice. Please try again.'
      end

      @io.puts
    end
  end

  private

  def list_albums
    albums = @album_repository.all
    @io.puts 'Here is the list of albums:'
    albums.each do |album|
      @io.puts " * #{album['id']} - #{album['title']}"
    end
  end

  def list_artists
    artists = @artist_repository.all
    @io.puts 'Here is the list of artists:'
    artists.each do |artist|
      @io.puts " * #{artist['id']} - #{artist['name']}"
    end
  end
end