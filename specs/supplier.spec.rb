# require ('minitest/autorun')
# require ('minitest/reporters')
# require_relative ('../models/supplier')
# require_relative ('../models/drink')
#
# Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
#
#
# class TestSupplier < Minitest::Test
#
#   #instantiate an object of Supplier class & Drink class to run tests on
#   def setup
#     @drink = Drink.new("Punk IPA", 4, "Brewcat", "0001", "bottle")
#
#     @supplier = Supplier.new("Brewcat", "001")
#   end
#
#   #Below are the basic read tests for a Drink objects initial attribute
#   def test_can_read_supplier_name
#     assert_equal("Brewcat", @supplier.name())
#   end
#
#   def test_supplier_products_start_at_zero
#     assert_equal(0, @supplier.products.length())
#   end
#
#   def test_supplier_preferred_status_defaults_to_false
#     assert_equal(false, @supplier.preferred())
#   end
#
#   def test_supplier_promotion_attribute_starts_as_false
#     assert_equal(false, @supplier.promotion())
#   end
#
#   def test_can_read_supplier_code
#     assert_equal("001", @supplier.supplier_code())
#   end
#
#   def test_can_add_drink_to_suppliers_product_list
#       @supplier.products.push(@drink)
#     assert_equal(1, @supplier.products.length())
#   end
#
# end
