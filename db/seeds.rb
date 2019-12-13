require_relative('../models/drink')
require_relative('../models/supplier')

@drink = Drink.new({
  "name" => "Punk IPA",
  "buy_cost" => 4,
  "supplier" => "Brewcat",
  "product_type" => "bottle",
  "product_code" => "0001"})
@drink.save()

@supplier = Supplier.new("Brewcat", "001")
