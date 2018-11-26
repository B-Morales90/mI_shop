# owner should be able to login and logout




class Owner
	include DataMapper::resource
        #property :id, Serial
        property :email, String
        property :password, String
        property :created_at, DateTime
       #property :administrator, Boolean default=>false
        #property :pro, Boolean default=>false
        #property :

    def login (password)
        return self.password == password
        
    end

end