
# file:spec/album_repository_spec.rb

require 'album_repository'
require 'csv'
require 'artist_repository'

describe AlbumRepository do
  let(:artist_repo) { ArtistRepository.new('data/artists_list.csv') }
  let(:repo) { AlbumRepository.new('data/albums_list.csv') }

  before(:each)do
    repo.set_artist_repository(artist_repo)
    artist_repo.set_album_repository(repo)
    repo.load_data
  end

  describe '#all' do
    it 'returns all albums in the database' do
      expect(repo.all.length).to eq(5)
    end
  end

  describe '#find_by_id' do
    it 'returns the album by id' do
      album = repo.find_by_id(1)

      expect(album.title).to eq('Rumours')
      expect(album.release_year).to eq 1977
    end
  end
end
