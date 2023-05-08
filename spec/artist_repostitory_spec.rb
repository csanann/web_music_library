# file: spec/artist_repository_spec.rb

require 'artist_repository'
require_relative '/Users/chayadasansiriwong/Desktop/csanann/Projects/web_music_library/data/artists_list.csv'

describe ArtistRepository do
  let(:repo) { ArtistRepository.new }

  describe '#all' do
    it 'returns all artists in the database' do
      expect(repo.all.length).to eq(5)
    end
  end

  describe '#find' do
    it 'returns the artist with the given ID' do
      artist = repo.find(1)
      expect(artist.id).to eq(1)
      expect(artist.name).to eq('Fleetwood Mac')
      expect(artist.genre).to eq('Soft Rock')
    end

    it 'returns nil if the artist does not exist' do
      expect(repo.find(100)).to be_nil
    end
  end
end


=begin
#file: spec/artist_repository_spec.rb
require 'artist'
require 'artist_repository'

def reset_artists_table
  seed_sql = File.read('spec/seeds/artists_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe ArtistRepository do
  before(:each) do 
    reset_artists_table
  end

  it 'finds all artists' do
    repo = ArtistRepository.new

    artists = repo.all
    
    expect(artists.length).to eq(4)
    expect(artists.first.name).to eq('Pixies')
  end

  it 'finds one artist' do
    repo = ArtistRepository.new

    artist = repo.find(3)
    
    expect(artist.id).to eq(3)
    expect(artist.name).to eq('Taylor Swift')
  end

  it 'creates an album' do
    repo = ArtistRepository.new

    artist = Artist.new
    artist.name = 'Kiasmos'
    artist.genre = 'Experimental'
    repo.create(artist)

    artists = repo.all

    expect(artists.length).to eq(5)
    expect(artists.last.name).to eq('Kiasmos')
  end
end
=end