# require ('minitest/autorun')
# require ('minitest/reporters')
# require_relative ('../models/drink')
#
# Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
#
#
# class TestDrink < Minitest::Test
#
#   #instantiate an object of Drink class to run tests on
#   def setup
#     @drink = Drink.new("Punk IPA", 4, "Brewcat", "0001", "bottle")
#   end
#
#   #Below are the basic read tests for a Drink objects initial attributes
#   def test_can_read_drink_name
#     assert_equal("Punk IPA", @drink.name())
#   end
#
#   def test_can_read_drink_buy_cost
#     assert_equal(4, @drink.buy_cost())
#   end
#
#   def test_can_read_supplier_of_product
#     assert_equal("Brewcat", @drink.supplier())
#   end
#
#   def test_can_read_product_code
#     assert_equal("0001", @drink.product_code())
#   end
#
#   def test_can_read_product_type
#     assert_equal("bottle", @drink.product_type())
#   end
#
#   def test_drink_starts_with_promotion_attribute_set_to_false
#     assert_equal(false, @drink.promotion())
#   end
#
# end
