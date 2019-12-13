require_relative ('../db/sql_runner')

class Supplier

  attr_reader :name, :preferred, :promotion, :supplier_code, :id

  def initialize(options)
    @name = options['name']
    @supplier_code = options['supplier_code']
    @preferred = options['preferred']
    @promotion = false
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO suppliers
    (
      name,
      supplier_code,
      preferred,
      promotion
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @supplier_code, @preferred, @promotion]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

end
