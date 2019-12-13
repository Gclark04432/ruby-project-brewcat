require ('minitest/autorun')
require ('minitest/reporters')
require_relative ('../models/inventory')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


class TestInventory < Minitest::Test

  def setup
    @inventory = Inventory.new()
  end

  def test_inventory_suppliers_starts_at_zero
    assert_equal(0, @inventory.suppliers.length())
  end

  def test_inventory_sotck_starts_at_zero
    assert_equal(0, @inventory.stock())
  end

  def test_inventory_products_starts_at_zero
    assert_equal(0, @inventory.products.length())
  end

end
