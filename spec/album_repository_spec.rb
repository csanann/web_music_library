
# file:spec/album_repository_spec.rb

require 'album_repository'
require 'web_music_library/albums_list.csv'
require 'web_music_library/artists_list.csv'

describe AlbumRepository do
  let(:artist_repo) { ArtistRepository.new }
  let(:repo) { AlbumRepository.new(artist_repo) }

  describe '#all' do
    it 'returns all albums in the database' do
      expect(repo.all.length).to eq(5)
    end
  end

  describe '#find' do
    it 'returns the album with the given ID' do
      album = repo.find(1)
      expect(album.id).to eq(1)
      expect(album.title).to eq('Rumours')
      expect(album.artist.id).to eq(1)
      expect(album.artist.name).to eq('Fleetwood Mac')
      expect(album.artist.genre).to eq('Soft Rock')
    end

    it 'returns nil if the album does not exist' do
      expect(repo.find(100)).to be_nil
    end
  end
end
