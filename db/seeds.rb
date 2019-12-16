require_relative('../models/drink')
require_relative('../models/supplier')

require ('pry')

Supplier.delete_all()
Drink.delete_all()

supplier1 = Supplier.new({
  "name" => "Brewcat",
  "supplier_code" => "001",
  "preferred" => true,
  "promotion" => false})
  supplier1.save()

supplier2 = Supplier.new({
  "name" => "Belhaven",
  "supplier_code" => "021",
  "preferred" => false,
  "promotion" => false})
  supplier2.save()

supplier3 = Supplier.new({
  "name" => "Smirnoff",
  "supplier_code" => "432",
  "preferred" => true,
  "promotion" => false})
  supplier3.save()

supplier4 = Supplier.new({
  "name" => "Stewarts",
  "supplier_code" => "907",
  "preferred" => false,
  "promotion" => true})
  supplier4.save()

drink1 = Drink.new({
  "name" => "Punk IPA",
  "buy_cost" => 4,
  "supplier" => "Brewcat",
  "product_type" => "bottle",
  "product_code" => "0001",
  "supplier_id" => supplier1.id})
  drink1.save()

# binding.pry()
# nil
