GET/artist and POST/artist Route Design Recipe
to test-drive a Sinatra route.

1. Design the Route Signature
GET/artists

POST/ artist
body parameters: name, genre

2. Design the Response

#1. GET/ artists
 Response: 200 ok, list of artists as plain text

#2. POST/artists
Response: 200 ok (no content)

3. Write Examples
Replace these with your own design.

# Request:

GET /artists

# Expected response:

Response for 200 OK
Pixies, ABBA, Taylor Swift, Nina Simone
# Request:

POST /artist
body parameters: 
name=Wild nothing
genre=Indie
# Expected response:

200 created ok/ no content

4. Encode as Tests Examples
# EXAMPLE
# file: spec/integration/application_spec.rb

get('/artists')
it 'returns the list of artists' do
      response => get('/artists')

      expect_response = 'Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos'

      response.status==>200 ok
      response.body==>expect_response
    
  end
  

    "POST /artists" 
    it 'creates a new artist' do
      response = post('/artists', id: '1', name: 'Wild nothing', genre: 'Indie')

      response.status=> 200
      response.body=> nothing

      response => get('/artists')

      response.body==>'Wild nothing')
    end

5. Implement the Route

get('/artists') 
    repo = ArtistRepository.new
    artists = repo.all
    response = artists.map do |artist|
      artist.name
    end.join(', ')

    return =>response
  end

  post '/artists' 
    repo = ArtistRepository.new
    new_artist = Artist.new
    new_artist.id = params[:id]
    new_artist.name = params[:name]
    new_artist.genre = params[:genre]

    repo.create =>new_artist

    return => nothing
  end