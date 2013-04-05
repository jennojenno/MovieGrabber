require 'test/unit'
require 'rack/test'
require_relative '../movie_server'

class MovieServerTest < Test::Unit::TestCase
	#Since we can only do single inheritance we can't also do < Rack::Test::Methods
	include Rack::Test::Methods
	#So we do the above instead 
	#Racktest needs to know where your application is
	def app
		Sinatra::Application
	end
	#The entirety of movie_server.rb is a class of Sinatra so 
	#we don't need actual class definitions inside 
	#We can think of all of that as class MovieServer 

	#What do we want to test?
	def test_welcome_page
		get '/' 
		follow_redirect!
		#assert last_response.ok? #does this page actually work (not 404)? 
		assert_equal last_request.path '/login'
		#similar would be assert last_response.code == 200 

	end 

	# def test_missing_name_redirects_to_home
	# 	post '/film', {} #forgot to put film name, testing empty field
	# 	follow_redirect! 
	# 	assert last_request.url '/'
	# 	assert
	# end

end
