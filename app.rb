require "sinatra"
require_relative "authentication.rb"
require_relative "item.rb"
require_relative "user.rb"

#the following urls are included in authentication.rb
# GET /login
# GET /logout
# GET /sign_up

# authenticate! will make sure that the user is signed in, if they are not they will be redirected to the login page
# if the user is signed in, current_user will refer to the signed in user object.
# if they are not signed in, current_user will be nil

get "/" do
	erb :index
end


get "/dashboard" do
	authenticate!
	erb :dashboard
end


get "/Shop_name" do
	erb :layout 
end

get "/new_item" do
	erb :new_item
end

post "/items/create" do
	i = Item.new
	i.name = params["name"]
	i.description = params["description"]
	i.quantity = params["quantity"].to_i
	i.price = params["price"].to_i
	i.save

end

Item.auto_upgrade!
User.auto_upgrade!
DataMapper.finalize

get "/delete item" do

end
  patch "/quantity" do
		i.quantity = params ["quantity"]

  end




# hash array to keep track of shoppers cart
# button to pay
# send email to owner at time of purchase