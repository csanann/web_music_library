require "spec_helper"
require "rack/test"
require_relative '../../app'
require '/Users/chayadasansiriwong/Desktop/csanann/Projects/web_music_library/data/albums_list.csv'
require '/Users/chayadasansiriwong/Desktop/csanann/Projects/web_music_library/data/artists_list.csv'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /artists" do
    it 'returns the list of artists' do
      response = get('/artists')

      expect_response = 'Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos'

      expect(response.status).to eq(200)
      expect(response.body).to eq(expect_response)
    end
  end
  

  context "POST /artists" do
    it 'creates a new artist' do
      response = post('/artists', id: '1', name: 'Wild nothing', genre: 'Indie')

      expect(response.status).to eq(200)
      expect(response.body).to eq('')

      response = get('/artists')

      expect(response.body).to include('Wild nothing')
    end
  end
end