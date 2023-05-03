

music_library/
  ├── app.rb #main entry point for th program, the file initialise the Application
  ├── application.rb # the main implementation of the Application class, incl welcome msg, display menu, gets user input, displays the list of albums and artists
  ├── database_connection.rb # sets up the db connection using the gp gem
  ├── data.sql
  ├── Gemfile
  ├── Gemfile.lock
  ├── lib/
  │   ├── album_repository.rb
  │   ├── artist_repository.rb
  │   └── terminal.rb
  ├── README.md
  └── spec/
      ├── album_repository_spec.rb
      ├── application_spec.rb #integration test for  behaviors of the Application class as a whole(incl AlbumRepo, ArtistRepo and Terminal classes
      ├── artist_repository_spec.rb
      └── spec_helper.rb

