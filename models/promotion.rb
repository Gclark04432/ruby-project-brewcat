require_relative ('../db/sql_runner')
require_relative ('./supplier')
require_relative ('./drink')

require ('pry')

class Promotion

  attr_reader :supplier_id, :drink_id, :percentage, :id

  def initialize(options)
    @supplier_id = options['supplier_id']
    @drink_id = options['drink_id']
    @percentage = options['percentage'].to_i
    @id = options['id'].to_i if options['id']
  end

  # CRUD methods below
  def save()
    sql = "INSERT INTO promotions
    (
      supplier_id,
      drink_id,
      percentage
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@supplier_id, @drink_id, @percentage]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.all()
    sql = "SELECT * FROM promotions"
    return map_promotions(SqlRunner.run(sql))
  end

  def self.find(id)
    sql = "SELECT * FROM promotions
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Promotion.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM promotions"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM promotions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def activate()
    @drinks = Supplier.drinks(@supplier_id)

    @drinks.each do |drink|

      current_margin = (drink.sell_price.to_f - drink.buy_cost.to_f)
      adjustment = (drink.buy_cost.to_f + (current_margin / (1 + @percentage.to_f/100)).to_f)
      sql = "UPDATE drinks SET
      sell_price = $1
      WHERE id = $2"
      values = [adjustment, drink.id]
      SqlRunner.run(sql, values)
    end
  end

  def self.map_promotions(promotion_data)
    return  promotion_data.map { |promotion| Promotion.new(promotion)}
  end

end
