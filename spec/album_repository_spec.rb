#file: ./spec/album_repository_spec.rb

require 'albums'
require_relative '../lib/album_repository'

def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
end

RSpec.describe AlbumsRepository do
    before(:each) do
        reset_albums_table
    end

    let(:repo) {AlbumsRepository.new}

    # other tests

    it 'find an album by id' do
        album = repo.find(1)
        expect(album.id).to eq("1")
        expect(album.title).to_not be_nil
    end
end