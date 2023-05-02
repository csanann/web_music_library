#file: terminal.rb
# this class handles all the input and output for the application

class Terminal
    def initialize(io)
      @io = io
    end 
  
    def welcome_message
      @io.puts 'Welcome to the music library manager!'
    end 
  
    def display_menu
      @io.puts 'What would you like to do?'
      @io.puts ' 1 - List all albums'
      @io.puts ' 2 - List all artists'
      @io.puts 
    end 
  
    def get_user_choice
      @io.puts 'Enter your choice:'
      choice = @io.gets.chomp.to_i
      return choice
    end
  
    def display_albums(albums)
      @io.puts 'Here is the list of albums:'
      albums.each do |album|
        @io.puts " * #{ album['id'] } - #{ album['title'] }"
      end
    end
  
    def display_artists(artists)
      @io.puts 'Here is the list of artists:'
      artists.each do |artist|
        @io.puts " * #{ artist['id'] } - #{ artist['name'] }"
      end 
    end 
  
    def invalid_choice_message
      @io.puts 'Invalid choice. Please try again.'
    end 
  end  