require 'pg'

class Space
  attr_reader :id, :name, :description, :price, :from_date, :to_date
  def initialize(id:, space_name:, space_description:, space_price:, from_date:, to_date:)
    @id = id
    @name = space_name
    @description = space_description
    @price = space_price
    @from_date = from_date
    @to_date = to_date
  end


  def self.create(space_name:, space_description:, space_price:, from_date:, to_date:, user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'DreamBnB_test')
    else
      connection = PG.connect(dbname: 'DreamBnB')
    end

    result = connection.exec("INSERT INTO space (space_name, space_description, space_price, from_date, to_date, user_id)
    VALUES('#{space_name}', '#{space_description}', '#{space_price}', '#{from_date}', '#{to_date}', '#{user_id}')
    RETURNING id, space_name, space_description, space_price, from_date, to_date;")
    Space.new(id: result[0]['id'], space_name: result[0]['space_name'], space_description: result[0]['space_description'], space_price: result[0]['space_price'], from_date: result[0]['from_date'], to_date: result[0]['to_date'])
  end



  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'DreamBnB_test')
    else
      connection = PG.connect(dbname: 'DreamBnB')
    end
      result = connection.exec("SELECT * FROM space;")
      result.map { |space| Space.new(id: space['id'], space_name: space["space_name"], space_description: space["space_description"], space_price: space["space_price"], from_date: space['from_date'], to_date: space['to_date']) }
  end

  def self.select_by_id(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'DreamBnB_test')
    else
      connection = PG.connect(dbname: 'DreamBnB')
    end
    result = connection.exec("SELECT * FROM space WHERE id = ('#{id}');")
    result.map { |space| Space.new(id: space['id'], space_name: space["space_name"], space_description: space["space_description"], space_price: space["space_price"], from_date: space['from_date'], to_date: space['to_date']) }
  end

end
