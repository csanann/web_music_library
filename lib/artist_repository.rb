#file: lib/artist_repository.rb

class ArtistRepository
    def initialize
      @artists = [
        { 'id' => 1, 'name' => 'Pixies' },
        { 'id' => 2, 'name' => 'ABBA' },
        { 'id' => 3, 'name' => 'Taylor Swift' },
        { 'id' => 4, 'name' => 'Nina Simone' },
        { 'id' => 5, 'name' => 'The Beatles' }
      ]
    end
  
    def all
      @artists
    end
  
    def find_by_id(artist_id)
      @artists.find { |artist| artist['id'] == artist_id }
    end
  end  