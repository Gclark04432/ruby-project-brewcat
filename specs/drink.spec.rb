require ('minitest/autorun')
require ('minitest/reporters')
require_relative ('../models/drink')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


class TestDrink < Minitest::Test

  def setup
    @drink = Drink.new("Punk IPA", 4)
  end

  def test_can_read_drink_name
    assert_equal("Punk IPA", @drink.name())
  end

  def test_can_read_drink_buy_cost
    assert_equal(4, @drink.buy_cost())
  end

end
