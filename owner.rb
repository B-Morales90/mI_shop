# owner should be able to login and logout




class Owner
	include DataMapper::resource
        
        property :email, String
        property :password, String
        property :created_at, DateTime
        property :shop_name
      

    def login (password)
        return self.password == password
        
    end

end