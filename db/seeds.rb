require_relative('../models/drink')
require_relative('../models/supplier')

require ('pry')

supplier1 = Supplier.new({
  "name" => "Brewcat",
  "supplier_code" => "001",
  "preferred" => false})
  supplier1.save()

  drink1 = Drink.new({
    "name" => "Punk IPA",
    "buy_cost" => 4,
    "supplier" => "Brewcat",
    "product_type" => "bottle",
    "product_code" => "0001",
    "supplier_id" => supplier1.id})
    drink1.save()

    binding.pry()
    nil
