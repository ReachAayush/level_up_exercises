require 'sinatra'

enable :sessions

get '/' do
  erb :cart_screen
end
