# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get('/artists') do
    repo = ArtistRepository.new
    artists = repo.all
    response = artists.map do |artist|
      artist.name
    end.join(', ')

    return response
  end

  get('/artists') do
    repo = ArtistRepository.new
    artist = repo.find(params[:id].to_i)
    response = "Artist details: \nName: #{artist.name}\nGenre: #{artist.genre}"

    return response
  end
  
  post '/artists' do
    repo = ArtistRepository.new
    new_artist = Artist.new
    new_artist.id = params[:id]
    new_artist.name = params[:name]
    new_artist.genre = params[:genre]

    repo.create(new_artist)

    return ''
  end
end