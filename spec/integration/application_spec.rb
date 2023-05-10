require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'csv'

RSpec.describe Application do
  include Rack::Test::Methods


  let(:app) { Application.new }

  context "GET /artists" do
    it 'returns the list of artists' do
      response = get('/artists')

      expect_response = 'Fleetwood Mac, Elton John, Phil Collins, Air Supply, James Taylor'

      expect(response.status).to eq(200)
      expect(response.body).to eq(expect_response)
    end
  end

#testing whether the server can create a new artist with the provided data and responses or not 
  context "POST /artists" do
    it 'creates and returns a new artist' do
      artist_data = {id: '1', name: 'Wild nothing', genre: 'Indie'}
      response = post('/artists', artist_data.to_json)


      expect(response.status).to eq(200)
      expect(response.body).to eq(artist_data.to_json)


      response = get('/artists')
      expect(response.body).to include('Wild nothing')
    end
  end
end