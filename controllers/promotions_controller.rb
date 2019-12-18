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
  p @promotions
  erb(:"promotion/index")
end

#new
get '/promotions/new' do
  @suppliers = Supplier.all
  erb(:"promotion/new")
end

#create
post '/promotions/?' do
  @promotion = Promotion.new(params)
  @promotion.save
  erb(:"promotion/create")
end

#destroy
post '/promotions/:id/delete' do
  @promotion = Promotion.find(params['id'])
  @promotion.delete()
  redirect to '/promotions'
end

# #edit
# get '/promotions/:id/edit' do
#   @promotion = Promotion.find(params[:id])
#   erb(:"promotion/edit")
# end

# #update
# post '/suppliers/:id/' do
#   Supplier.new(params).update
#   redirect to '/suppliers/?'
# end
