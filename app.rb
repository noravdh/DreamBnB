require 'sinatra/base'
require './lib/user'

class DreamBnB < Sinatra::Base

  get '/test' do
    'Test page'
  end

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
