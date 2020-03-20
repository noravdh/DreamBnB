require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'DreamBnB_test')
  connection.exec("TRUNCATE login;")
  connection.exec("TRUNCATE space;")
  space = Space.create(space_name: "Sunny Appartment", space_description: "test description", space_price: "500", from_date: "01/01/01", to_date: "01/01/01", user_id: "1")
end
