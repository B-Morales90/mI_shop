# if not use sqlite3 database I gave you
if ENV['DATABASE_URL']
  DataMapper::setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
else
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/app.db")
end

class User
    include DataMapper::Resource
    property :name, String
    property :id, Serial
    property :email, String
    property :password, String
    property :created_at, DateTime

    def login(password)
      return self.password == password
    end
end


class Item
     include DataMapper::Resource
     property :id, Serial
    property :name, String
    property :description, Text 
    property :quantity, Integer
    property :price, Integer

end


# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize
Item.auto_upgrade!

# automatically create the post table
 User.auto_upgrade!

