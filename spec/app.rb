require_relative '../lib/album_repository'

repo = AlbumsRepository.new
album = repo.find(3)

puts "Album ID: #{album.id}"
puts "Title: #{album.title}"
puts "Artist: #{album.artist}"