require 'pg'

class Booking
  attr_reader :id, :space_renter, :space_id, :dates


  def initialize(id:, space_renter:, space_id:, dates:)
    @id = id
    @space_renter = space_renter
    @space_id = space_id
    @dates = dates
  end


  def self.create(space_renter:, space_id:, dates:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'DreamBnB_test')
    else
      connection = PG.connect(dbname: 'DreamBnB')
    end


    result = connection.exec("INSERT INTO booking (space_renter, space_id, dates)
    VALUES('#{space_renter}', '#{space_id}', '{#{dates}}')
    RETURNING id, space_renter, space_id, dates;")
    Booking.new(id: result[0]['id'], space_renter: result[0]['space_renter'], space_id: result[0]['space_id'], dates: result[0]['dates'])
end
end
