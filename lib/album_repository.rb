#file: lib/album_repository.rb

class AlbumRepository
    def initialize
      @albums = [
        { 'id' => 1, 'title' => 'Doolittle', 'artist_id' => 1 },
        { 'id' => 2, 'title' => 'Surfer Rosa', 'artist_id' => 1 },
        { 'id' => 3, 'title' => 'Waterloo', 'artist_id' => 2 },
        { 'id' => 4, 'title' => 'Super Trouper', 'artist_id' => 2 },
        { 'id' => 5, 'title' => 'Bossanova', 'artist_id' => 1 },
        { 'id' => 6, 'title' => 'Lover', 'artist_id' => 3 },
        { 'id' => 7, 'title' => 'Folklore', 'artist_id' => 3 },
        { 'id' => 8, 'title' => 'I Put a Spell on You', 'artist_id' => 4 },
        { 'id' => 9, 'title' => 'Baltimore', 'artist_id' => 4 },
        { 'id' => 10, 'title' => 'Here Comes the Sun', 'artist_id' => 5 },
        { 'id' => 11, 'title' => 'Fodder on My Wings', 'artist_id' => 4 },
        { 'id' => 12, 'title' => 'Ring Ring', 'artist_id' => 2 }
      ]
    end
  
    def all
      @albums
    end
  end  