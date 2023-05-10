# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'
require 'csv'

arg1 = "Artist name"
arg2 = "Artist genre"
arg3 = 1

artist = Artist.new(arg1, arg2, arg3)
puts "Artist name: #{artist.name}"
puts "Artist genre: #{artist.genre}"
puts "Artist id: #{artist.id}"

DatabaseConnection.connect


class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end


  configure do
    set :show_exceptions, false
    set :raise_errors, false
  end


  error do
    exception = env['sinatra.error']
    puts "Error occurred: #{exception.message}"
    puts exception.backtrace
    status 500
  end


  get('/artists') do
    repo = ArtistRepository.new('data/artists_list.csv')
    album_repo = AlbumRepository.new('data/albums_list.csv')
    repo.set_album_repository(album_repo)
    album_repo.set_artist_repository(repo)
    repo.load_data


    artists = repo.all
    response = artists.map do |artist|
      artist.name
    end.join(', ')


    return response
  end


  get('/artists/:id') do
    repo = ArtistRepository.new('data/artists_list.csv')
    album_repo = AlbumRepository.new('data/albums_list.csv')
    repo.set_album_repository(album_repo)
    album_repo.set_artist_repository(repo)
    repo.load_data


    artist = repo.find_by_id(params[:id].to_i)
    response = "Artist details: \nName: #{artist.name}\nGenre: #{artist.genre}"


    return response
  end


  post '/artists' do
    begin
      repo = ArtistRepository.new('data/artists_list.csv')
      album_repo = AlbumRepository.new('data/albums_list.csv')
      repo.set_album_repository(album_repo)
      album_repo.set_artist_repository(repo)
      repo.load_data


      new_artist = Artist.new(params[:name], params[:genre], [])
      new_artist.id = params[:id]


      repo.create(new_artist)


      return ''
    rescue StandardError => e
      puts "Error: #{e.message}"
      raise e
    end
  end
end
