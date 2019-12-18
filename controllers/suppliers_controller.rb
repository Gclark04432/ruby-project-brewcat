require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/drink.rb' )
require_relative( '../models/supplier.rb' )
also_reload( '../models/*' )

#index
get '/suppliers/?' do
  @suppliers = Supplier.all()
  erb(:"supplier/index")
end

#new
get '/suppliers/new' do
  @suppliers = Supplier.all
  erb(:"supplier/new")
end

#show
get '/suppliers/:id' do
  @supplier = Supplier.find(params[:id])
  @drinks = Supplier.drinks(@supplier.id)
  erb(:"supplier/show")
end

#create
post '/suppliers/?' do
  @supplier = Supplier.new(params)
  @supplier.save
  erb(:"supplier/create")
end

#edit
get '/suppliers/:id/edit' do
  @supplier = Supplier.find(params[:id])
  erb(:"supplier/edit")
end

#update
post '/suppliers/:id/' do
  Supplier.new(params).update
  redirect to '/suppliers/?'
end

#destroy/deactivate
