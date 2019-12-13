require_relative('../models/drink')
require_relative('../models/supplier')

@supplier = Supplier.new({
  "name" => "Brewcat",
  "supplier_code" => "001"})
  @supplier.save()

  drink = Drink.new({
    "name" => "Punk IPA",
    "buy_cost" => 4,
    "supplier" => "Brewcat",
    "product_type" => "bottle",
    "product_code" => "0001",
    "supplier_id" => @supplier.id})
    drink.save()
