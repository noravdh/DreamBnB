require 'pg'

class User

  attr_reader :user_name
  attr_reader :password

  def initialize(user_name, password)
    @user_name = user_name
    @password = password
  end

end
