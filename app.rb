require 'sinatra/base'
require './lib/space'
require './lib/user'
require './lib/booking'
require 'date'


class DreamBnB < Sinatra::Base
enable :sessions
  get '/test' do
    'Test page'
  end


  get '/add-space' do
    erb :add_space
  end

  post '/new-space' do
    @user = session[:user]
    @space = Space.create(user_id: @user.user_id, space_name: params[:name], space_description: params[:description], space_price: params[:price],
      from_date: params[:from], to_date: params[:to])
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces

  end

  get '/' do
    erb :"sign_up"
  end


  post '/' do
    @user = User.create(user_name: params[:user_name], password: params[:password])
    session[:user] = @user
    redirect '/spaces'
  end

  get '/calendar/:id' do
    @requested_space = Space.select_by_id(id: params[:id]).first
    session[:space_id] = @requested_space.id
    @from_date = (Date.parse(@requested_space.from_date))
    @to_date = (Date.parse(@requested_space.to_date))
    @date_array = (@from_date..@to_date)
    erb :calendar
  end

  post '/bookings' do
    @user = session[:user]
    @space_id = session[:space_id]
    @dates = params[:date]
    booking = Booking.create(space_renter: @user.user_name, space_id: @space_id, dates: @dates)
    @booked_space = Space.select_by_id(id: @space_id).first
    erb :bookings
    # push every param into an array
    # push array into postgres
    # booking table we want dates, space_renter, space_id foreign key - id?,
    # make a space id when we create a space
    # space table add a space owner
  end

  run! if app_file == $0
end
