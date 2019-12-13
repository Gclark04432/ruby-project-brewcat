require_relative ('../db/sql_runner')

class Drink

  attr_reader :name, :buy_cost, :supplier, :product_code, :product_type, :promotion

  def initialize(options)
    @name = options['name']
    @buy_cost = options['buy_cost']
    @supplier = options['supplier']
    @product_type = options['product_type']
    @product_code = options['product_code']
    @promotion = false
  end

  def save()
    sql = "INSERT INTO drinks
    (
      name,
      buy_cost,
      supplier,
      product_type,
      product_code,
      promotion
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @buy_cost, @supplier, @product_type, @product_code, @promotion]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

end
