require_relative('../models/drink')
require_relative('../models/supplier')

require ('pry')

Supplier.delete_all()
Drink.delete_all()

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
  "supplier" => "Brewcat",
  "product_type" => "bottle",
  "product_code" => "0001",
  "supplier_id" => supplier1.id})
  drink1.save()

drink2 = Drink.new({
  "name" => "Elvis Juice",
  "buy_cost" => 4.5,
  "supplier" => "Brewcat",
  "product_type" => "keg",
  "product_code" => "0002",
  "supplier_id" => supplier1.id})
  drink2.save()

drink3 = Drink.new({
  "name" => "Belhaven Best",
  "buy_cost" => 2.1,
  "supplier" => "Belhaven",
  "product_type" => "cask",
  "product_code" => "0554",
  "supplier_id" => supplier2.id})
  drink3.save()

drink4 = Drink.new({
  "name" => "Edinburgh Rock",
  "buy_cost" => 2.7,
  "supplier" => "Belhaven",
  "product_type" => "cask",
  "product_code" => "9654",
  "supplier_id" => supplier2.id})
  drink4.save()

drink5 = Drink.new({
  "name" => "Red Vodka",
  "buy_cost" => 12,
  "supplier" => "Smirnoff",
  "product_type" => "spirits",
  "product_code" => "2003",
  "supplier_id" => supplier3.id})
  drink5.save()

drink6 = Drink.new({
  "name" => "Smirnoff Ice",
  "buy_cost" => 3,
  "supplier" => "Smirnoff",
  "product_type" => "bottle",
  "product_code" => "9765",
  "supplier_id" => supplier3.id})
  drink6.save()

drink7 = Drink.new({
  "name" => "Stewart's Lager",
  "buy_cost" => 3.4,
  "supplier" => "Stewart's",
  "product_type" => "keg",
  "product_code" => "4002",
  "supplier_id" => supplier4.id})
  drink7.save()

drink8 = Drink.new({
  "name" => "Black Stout",
  "buy_cost" => 2.1,
  "supplier" => "Belhaven",
  "product_type" => "cask",
  "product_code" => "8888",
  "supplier_id" => supplier2.id})
  drink8.save()

drink9 = Drink.new({
  "name" => "Tactical Nuclear Penguin",
  "buy_cost" => 9,
  "supplier" => "Brewcat",
  "product_type" => "keg",
  "product_code" => "3423",
  "supplier_id" => supplier1.id})
  drink9.save()
