require "sinatra"
require_relative "authentication.rb"
get "/Shop_name"do
erb:layout 
end
 get "/new_item"do
erb: new_item
end
post "/new item" do
	i = Item.new
	i.name = params["name"]
	i.description
	i.quantity = params ["quantity"]
	i.price = params ["price"]

end

get "/delete item" do

end
  patch "/quantity" do
		i.quantity = params ["quantity"]

  end




# hash array to keep track of shoppers cart
# button to pay
# send email to owner at time of purchase