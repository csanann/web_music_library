#file: album_repo_class_recipe.md

ALBUMS Model and Repository Classes Design Recipe
Copy this recipe template to design and implement Model and Repository classes for a database table.

1. Design and create the Table
The table is already created in the database, you can skip this step.

2. Create Test SQL seeds

-- (file: spec/seeds_music_library.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE students RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO students (name, cohort_name) VALUES ('David', 'April 2022');
INSERT INTO students (name, cohort_name) VALUES ('Anna', 'May 2022');


# psql -h 127.0.0.1 your_database_name < {./spec/}seeds_{table_name}.sql

3. Define the class names

# EXAMPLE
# Table name: albums

# Model class
# (in lib/student.rb)
class Albums
end

# Repository class
# (in lib/albums_repository.rb)
class AlbumsRepository
end
4. Implement the Model class

# EXAMPLE
# Table name: students

# Model class
# (in lib/albums.rb)

class Albums

  # Replace the attributes by your own columns.
  attr_accessor :id, :title, :release_year, :artist_id
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# student = Student.new
# student.name = 'Jo'
# student.name
You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: students

# Repository class
# (in lib/albums_repo)

class AlbumsRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums;

    # Returns an array of Album objects.
  end
end

6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests. > create albums_repo_spec.rb to test

# 1
# Get all albums

repo = AlbumsRepository.new
albums = repo.all

albums.length #=> 2
albums.first.title #=> 'Bossanova'
albums.first.release_year #=> '1999'
albums.first.artist_id  => '1'


7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/albums_repository_spec.rb
#copy the first chunk to the albums_repo_spec.rb
def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'albums' })
  connection.exec(seed_sql)
end

describe AlbumsRepository do
  before(:each) do 
    reset_albums_table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behavior
