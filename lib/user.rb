require 'pg'

class User

  attr_reader :user_name
  attr_reader :password
  attr_reader :user_id

  def initialize(user_name:, password:, user_id:)
    @user_name = user_name
    @password = password
    @user_id = user_id
  end

  def self.create(user_name:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'DreamBnB_test')
    else
      connection = PG.connect(dbname: 'DreamBnB')
    end

    result = connection.exec("INSERT INTO login (user_name, password) VALUES('#{user_name}', '#{password}')RETURNING user_id, user_name, password;")
    User.new(user_name: result[0]['user_name'], password: result[0]['password'], user_id: result[0]['user_id'])

end
end
