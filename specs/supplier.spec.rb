require ('minitest/autorun')
require ('minitest/reporters')
require_relative ('../models/supplier')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


class TestSupplier < Minitest::Test

  def setup
    @supplier = Supplier.new("Belhaven")
  end

  def test_can_read_supplier_name
    assert_equal("Belhaven", @supplier.name())
  end

  def test_supplier_products_start_at_zero
    assert_equal(0, @supplier.products.length())
  end

  def test_supplier_preferred_status_defaults_to_false
    assert_equal(false, @supplier.preferred())
  end

end
