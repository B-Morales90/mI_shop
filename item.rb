require 'data_mapper' # metagem, requires common plugins too.

if ENV['DATABASE_URL']
  DataMapper::setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
else
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/app.db")
end

class Item
	 include DataMapper::Resource
	property :name, String
	property :description, String
	property :quantity, Integer
	property :price, Integer

end

#DataMapper.finalize

#need an array of items
