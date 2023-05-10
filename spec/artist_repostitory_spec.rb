# file: spec/artist_repository_spec.rb

require 'artist_repository'
require 'csv'
require 'album_repository'

describe ArtistRepository do
  let(:repo) { ArtistRepository.new('data/artists_list.csv') }
  let(:album_repo) { double('AlbumRepository') }
  let(:artist_repo) { double('ArtistRepository') }
  

  before(:each)do
    allow(album_repo).to receive(:set_artist_repository)
    allow(album_repo).to receive(:find_by_id).and_return(nil)

    repo.set_album_repository(album_repo)
    album_repo.set_artist_repository(artist_repo)
    repo.load_data
  end
  

  describe '#all' do
    it 'returns all artists in the database' do
      expect(repo.all.length).to eq(5)
    end
  end

  describe '#find' do
    it 'returns the artist with the given ID' do
      artist = repo.find_by_id(1)

      expect(artist.id).to eq(1)
      expect(artist.name).to eq('Fleetwood Mac')
      expect(artist.genre).to eq('Soft Rock')
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