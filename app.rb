require 'sinatra/base'
require './lib/space'
require './lib/user'


class DreamBnB < Sinatra::Base

  get '/test' do
    'Test page'
  end


  get '/add-space' do
    erb :add_space
  end

  post '/new-space' do
    @space = Space.create(space_name: params[:name])
    redirect '/spaces'
  end

  get '/spaces' do
    erb :spaces

  get '/' do
    'Welcome to DreamBnB'
  end

  post '/sign-up' do
    'You have signed up to DreamBnB!'
    erb :"sign_up"
    redirect '/'
  end

  run! if app_file == $0
end
