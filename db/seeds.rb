require_relative('../models/drink')
require_relative('../models/supplier')
require_relative('../models/promotion')

require ('pry')

Supplier.delete_all()
Drink.delete_all()
Promotion.delete_all()

supplier1 = Supplier.new({
  "name" => "Brewcat",
  "supplier_code" => "001"})
  supplier1.save()

supplier2 = Supplier.new({
  "name" => "Belhaven",
  "supplier_code" => "021"})
  supplier2.save()

supplier3 = Supplier.new({
  "name" => "Smirnoff",
  "supplier_code" => "432"})
  supplier3.save()

supplier4 = Supplier.new({
  "name" => "Stewarts",
  "supplier_code" => "907"})
  supplier4.save()



drink1 = Drink.new({
  "name" => "Punk IPA",
  "buy_cost" => 4,
  "supplier" => supplier1.name,
  "stock_level" => 50,
  "supplier_id" => supplier1.id})
  drink1.save()

drink2 = Drink.new({
  "name" => "Elvis Juice",
  "buy_cost" => 4.5,
  "supplier" => supplier1.name,
  "stock_level" => 0,
  "supplier_id" => supplier1.id})
  drink2.save()

drink3 = Drink.new({
  "name" => "Belhaven Best",
  "buy_cost" => 2.1,
  "supplier" => supplier2.name,
  "stock_level" => 20,
  "supplier_id" => supplier2.id})
  drink3.save()

drink4 = Drink.new({
  "name" => "Edinburgh Rock",
  "buy_cost" => 2.7,
  "supplier" => supplier2.name,
  "stock_level" => 7,
  "supplier_id" => supplier2.id})
  drink4.save()

drink5 = Drink.new({
  "name" => "Red Vodka",
  "buy_cost" => 11,
  "supplier" => supplier3.name,
  "stock_level" => 17,
  "supplier_id" => supplier3.id})
  drink5.save()

drink6 = Drink.new({
  "name" => "Smirnoff Ice",
  "buy_cost" => 3,
  "supplier" => supplier3.name,
  "stock_level" => 25,
  "supplier_id" => supplier3.id})
  drink6.save()

drink7 = Drink.new({
  "name" => "Stewart's Lager",
  "buy_cost" => 3.4,
  "supplier" => supplier4.name,
  "stock_level" => 10,
  "supplier_id" => supplier4.id})
  drink7.save()

drink8 = Drink.new({
  "name" => "Black Stout",
  "buy_cost" => 2.1,
  "supplier" => supplier2.name,
  "stock_level" => 15,
  "supplier_id" => supplier2.id})
  drink8.save()

drink9 = Drink.new({
  "name" => "Tactical Nuclear Penguin",
  "buy_cost" => 9,
  "supplier" => supplier1.name,
  "stock_level" => 0,
  "supplier_id" => supplier1.id})
  drink9.save()

promotion1 = Promotion.new({
  "supplier_id" => supplier1.id,
  "drink_id" => drink1.id,
  "percentage" => "10"
  })
  promotion1.save()

promotion2 = Promotion.new({
  "supplier_id" => supplier2.id,
  "drink_id" => drink8.id,
  "percentage" => "5"
  })
promotion2.save()


  # binding.pry()
  # nil
