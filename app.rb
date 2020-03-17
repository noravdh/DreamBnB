require 'sinatra/base'
require './lib/user'

class DreamBnB < Sinatra::Base

  get '/test' do
    'Test page'
  end

  get '/' do
    'Welcome to DreamBnB'
  end

  get '/sign-up' do
    erb :"sign_up"
  end

  post '/sign-up' do
    redirect '/'
  end

  run! if app_file == $0
end
