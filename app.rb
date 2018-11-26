require "sinatra"
require_relative "authentication.rb"

get "/new item" do
	i = Item.new
	i.name = params["name"]
	i.description
	i.quantity = params ["quantity"]
	i.price = params ["price"]

end

get "/delete item" do
 

end
 

