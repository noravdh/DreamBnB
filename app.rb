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
    @space = Space.create(space_name: params[:name], space_description: params[:description], space_price: params[:price])
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all 
    erb :spaces
  end

  get '/' do
    'Welcome to DreamBnB'
  end

  get '/sign-up' do
    erb :"sign_up"
  end

  post '/sign-up' do
    @user = User.create(user_name: params[:user_name], password: params[:password])
    redirect '/'
  end

  run! if app_file == $0
end
