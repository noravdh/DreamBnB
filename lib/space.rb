require 'pg'

class Space
  attr_reader :name, :description, :price
  def initialize(space_name:, space_description:, space_price:)
    @name = space_name
    @description = space_description
    @price = space_price
  end


  def self.create(space_name:, space_description:, space_price:, from_date:, to_date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'DreamBnB_test')
    else
      connection = PG.connect(dbname: 'DreamBnB')
    end

    result = connection.exec("INSERT INTO space (space_name, space_description, space_price, from_date, to_date)
    VALUES('#{space_name}', '#{space_description}', '#{space_price}', '#{from_date}', '#{to_date}')
    RETURNING space_name, space_description, space_price, from_date, to_date;")
    Space.new(space_name: result[0]['space_name'], space_description: result[0]['space_description'], space_price: result[0]['space_price'])
  end



  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'DreamBnB_test')
    else
      connection = PG.connect(dbname: 'DreamBnB')
    end
      result = connection.exec("SELECT * FROM space;")
      result.map { |space| Space.new(space_name: space["space_name"], space_description: space["space_description"], space_price: space["space_price"]) }
  end

end
