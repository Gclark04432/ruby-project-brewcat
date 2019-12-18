require_relative ('../db/sql_runner')
require_relative ('./supplier')
require_relative ('./drink')

require ('pry')

class Promotion

  attr_reader :supplier_id, :drink_id, :id
  attr_accessor :type

  def initialize(options)
    @supplier_id = options['supplier_id']
    @drink_id = options['drink_id']
    @type = options['type']
    @id = options['id'].to_i if options['id']
  end

  # CRUD methods below
  def save()
    sql = "INSERT INTO promotions
    (
      supplier_id,
      drink_id,
      type
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@supplier_id, @drink_id, @type]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE promotions SET
    (
      supplier_id,
      drink_id,
      type
    )
    =
    (
      $1, $2, $3
      ) WHERE id = $4"
      values = [@supplier_id, @drink_id, @type, @id]
      SqlRunner.run(sql, values)
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

    def self.map_promotions(promotion_data)
      return  promotion_data.map { |promotion| Promotion.new(promotion)}
    end

  end
