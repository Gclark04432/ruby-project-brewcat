require('sinatra')
require('sinatra/contrib/all')
require_relative('models/drink')
require_relative('models/supplier')
also_reload('./models/*')

get '/' do
  @suppliers = Supplier.all()
  @drinks = Drink.all()
  erb(:index)
end
