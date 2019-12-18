require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/drink.rb' )
require_relative( '../models/supplier.rb' )
require_relative( '../models/promotion.rb')
also_reload( '../models/*' )

#index
get '/promotions/?' do
  @promotions = Promotion.all()
  erb(:"promotion/index")
end

#new
get '/promotions/new' do
  @suppliers = Supplier.all
  erb(:"promotion/new")
end
#
# #show
# get '/suppliers/:id' do
#   @supplier = Supplier.find(params[:id])
#   @drinks = Supplier.drinks(@supplier.id)
#   erb(:"supplier/show")
# end
#
#create
post '/promotions/?' do
  @promotion = Promotion.new(params)
  @promotion.save
  erb(:"promotion/create")
end
#
# #edit
# get '/suppliers/:id/edit' do
#   @supplier = Supplier.find(params[:id])
#   erb(:"supplier/edit")
# end
#
# #update
# post '/suppliers/:id/' do
#   Supplier.new(params).update
#   redirect to '/suppliers/?'
# end
