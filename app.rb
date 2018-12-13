require "sinatra"
require_relative "authentication.rb"

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

get '/new_item' do
	erb :new_item
end

 post '/new_item' do
	i = Item.new
	i.name = params["name"]
	i.description = params["description"]
	i.quantity = params["quantity"].to_i
	i.price = params["price"].to_i
	return output# added to display data to table
	i.save
	redirect "/item_list"

end



get "/item_list" do
	@Items = Item.all
	#erb :item_list# orginal
	# the following is a table to display items
	erb :item_display_table

end


get "/delete item" do
		 i = Item.get(params["name"])
 		if i != nil
  		i.destroy
 		end
 		redirect "/item_list" # added to stay on display table
end


  patch "/quantity" do
		i.quantity = params ["quantity"]

  end
# hash array to keep track of shoppers cart
# button to pay
# send email to owner at time of purchase