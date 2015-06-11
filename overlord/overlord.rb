# run `ruby overlord.rb` to run a webserver for this app

require 'sinatra'
require_relative 'bomb'

enable :sessions

get '/' do
  erb :boot_screen
end

get '/activate/' do
  act_code = params[:act_code]
  deact_code = params[:deact_code]
  new_bomb = Bomb.new()
  new_bomb.boot(act_code, deact_code)
  write_bomb(new_bomb)
  erb :activation_screen
end

post '/activate/' do
  act_code = params[:act_code]
  thebomb = session[:bomb]
  thebomb.activate_bomb(act_code)
  write_bomb(thebomb)
  if thebomb.status.eql? "active"
    erb :deactivation_screen
  else
    erb :activation_screen
  end
end

post '/deactivate/' do
  deact_code = params[:deact_code]
  thebomb = session[:bomb]
  thebomb.deactivate_bomb(deact_code)
  write_bomb(thebomb)
  if thebomb.status.eql? "active"
    erb :deactivation_screen
  elsif thebomb.status.eql? "exploded"
    erb :exploded_screen
  else
    erb :activation_screen
  end
end

get '/exploded/' do
  erb :exploded_screen
end

# we can shove stuff into the session cookie YAY!
def start_time
  session[:start_time] ||= (Time.now).to_s
end

def write_bomb(b)
  session[:bomb] = b
end
