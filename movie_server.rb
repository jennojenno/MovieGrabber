require 'sinatra'
require 'rack-flash'
require 'pry'

enable :sessions
use Rack::Flash


require_relative 'movies'


before '/' do 
	# unless params[:password] == "coolbeans"
	# 	flash[:notice] = "Sorry, wrong password"
		redirect '/login'
	# end
end


get '/' do
  erb :login
end


post '/login' do
	unless params[:password] == "coolbeans"
		flash[:notice] = "Sorry, wrong password"
		redirect '/login'
	else erb :index
	end
end

post '/film' do
  # Search for a Movie
  # HINT - what is in params ?
 
  spacefix = params[:film].gsub(" ", "%20")
  movie = Movie.get_film_info(spacefix)

  erb :film, :locals => {:film => movie}

  # if params[:name].nil? or params[:name] == ""
  # 	redirect '/'
  # end
  # the above if is for testing an empty movie field 


end

get '/login' do
  erb :login
end

