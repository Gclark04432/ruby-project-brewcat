require_relative ('../db/sql_runner')

class Supplier

  attr_reader :name, :products, :preferred, :promotion, :supplier_code

  def initialize(name, supplier_code, preferred = false)
    @name = name
    @supplier_code = supplier_code
    @preferred = preferred
    @products = []
    @promotion = false
  end

end
