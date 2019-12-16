require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/drink.rb' )
require_relative( '../models/supplier.rb' )
also_reload( '../models/*' )

#show
get '/suppliers/?' do
  @suppliers = Supplier.all()
  erb(:"supplier/show")
end

#new
get '/suppliers/new' do
  @suppliers = Supplier.all
  erb(:"supplier/new")
end

#create
post '/suppliers/?' do
  @supplier = Supplier.new(params)
  @supplier.save
  erb(:"supplier/create")
end

#edit
get '/suppliers/:id' do
  @supplier = Supplier.new(params)
  @supplier.update(params)
  erb(:"supplier.edit")
end

#update

#destroy/deactivate
