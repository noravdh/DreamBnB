require 'sinatra/base'
require './lib/space'

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
  end

  run! if app_file == $0
end
