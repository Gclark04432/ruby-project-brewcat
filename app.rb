require('sinatra')
require('sinatra/contrib/all')
require_relative('models/drink')
require_relative('models/supplier')
require_relative('controllers/supplier_controller.rb')
also_reload('./models/*')

get '/' do
  @drinks = Drink.all()
  erb(:home)
end
