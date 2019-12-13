class Supplier

  attr_reader :name, :products, :preferred

  def initialize(name, preferred = false)
    @name = name
    @products = []
    @preferred = preferred
  end

end
