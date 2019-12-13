require_relative ('../db/sql_runner')

class Inventory

  attr_reader :suppliers, :products, :stock

  def initialize()
    @suppliers = []
    @products = []
    @stock = 0
  end

end
