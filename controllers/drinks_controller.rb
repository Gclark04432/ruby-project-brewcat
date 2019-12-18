require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/drink.rb' )
require_relative( '../models/supplier.rb' )
require_relative( '../models/promotion.rb')
also_reload( '../models/*' )

require ('pry')
#index

get '/drinks/?' do
  @suppliers = Supplier.all()

  if params[:supplier_id]
    @drinks = Supplier.drinks(params[:supplier_id].to_i)
  else
    @drinks = Drink.all()
  end
  erb(:"drink/index")
end

#new
get '/drinks/new' do
  @drinks = Drink.all
  @suppliers = Supplier.all
  erb(:"drink/new")
end

#show
get '/drinks/:id' do
  @drink = Drink.find(params[:id])
  erb(:"drink/show")
end

#create
post '/drinks/?' do
  @drink = Drink.new(params)
  @drink.save
  erb(:"drink/create")
end

#edit
get '/drinks/:id/edit' do
  @drink = Drink.find(params[:id])
  erb(:"drink/edit")
end

#update
post '/drinks/:id' do
  Drink.new(params).update
  redirect to '/drinks'
end

binding.pry()
#Order
get '/drinks/:id/order' do
  @drink = Drink.find(params[:id])
  erb(:"drink/order")
end

post '/drinks/:id/order-confirmation' do
  @drink = Drink.find(params[:id])
  @drink.add_stock(params[:order_amount].to_i)
  redirect to "/drinks/#{params[:id]}"
end
