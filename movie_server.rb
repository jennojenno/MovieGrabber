require 'sinatra'
require 'rack-flash3'
require 'pry'

require_relative 'movies'


before '/' do 
	unless params[:password] == "coolbeans"
		flash[:notice] = "Sorry, wrong password"
		redirect '/login'
	end
end


get '/' do
  erb :index
end


post '/login' do
  erb :index
end

post '/film' do
  # Search for a Movie
  # HINT - what is in params ?
 
  spacefix = params[:film].gsub(" ", "%20")
  movie = Movie.get_film_info(spacefix)

  erb :film, :locals => {:film => movie}


end

get '/login' do
  erb :login
end

# get '/output' do

# 	#film = params[:film]
# 	raise movie.inspect
# 	erb :output, :locals => {:film => movie}

# 	#binding.pry

# end
