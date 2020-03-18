require 'pg'

class Space
  attr_reader :name, :description, :price
  def initialize(space_name:, space_description:, space_price:)
    @name = space_name
    @description = space_description
    @price = space_price
  end


  def self.create(space_name:, space_description:, space_price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'DreamBnB_test')
    else
      connection = PG.connect(dbname: 'DreamBnB')
    end

    result = connection.exec("INSERT INTO space (space_name, space_description, space_price) VALUES('#{space_name}', '#{space_description}', '#{space_price}')RETURNING space_name, space_description, space_price;")
    Space.new(space_name: result[0]['space_name'], space_description: result[0]['space_description'], space_price: result[0]['space_price'])
  end
end
