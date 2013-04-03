require 'test/unit'
require 'sqlite3'
require 'httparty'
require 'json'
require 'pry'
require_relative '../movies'

class MovieGrabberTest < Test::Unit::TestCase

  def setup
    @@db = SQLite3::Database.new("test/test.db")
  end

  def test_get_film_info_method
    Movie.get_film_info("jaws") #don't change 

    # Don't forget to create your movies table first, using sqlite3...
    movies = @@db.execute("select * from movies")
    movies.length.should == 1
    movies.first[1].should == "Jaws" # Note, this can change if you want/need
    # Add other parts to your test here...
  end

  def teardown
    @@db.close
  end
end

PULL THIS NEW FILE 