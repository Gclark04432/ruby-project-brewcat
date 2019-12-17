require_relative ('../db/sql_runner')
require_relative ('./supplier')

require ('pry')

class Drink

  attr_reader :id, :supplier_id
  attr_accessor :name, :buy_cost, :supplier, :stock_level, :sell_price

  def initialize(options)
    @name = options['name']
    @buy_cost = options['buy_cost']
    @sell_price = options['sell_price'] || @buy_cost.to_i * 1.2
    @supplier = options['supplier']
    @stock_level = options['stock_level']
    @supplier_id = options['supplier_id']
    @id = options['id'].to_i if options['id']
  end

  #CRUD methods below
  def save()
    sql = "INSERT INTO drinks
    (
      name,
      buy_cost,
      sell_price,
      supplier,
      stock_level,
      supplier_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @buy_cost, @sell_price, @supplier, @stock_level, @supplier_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE drinks SET
    (
      name,
      buy_cost,
      sell_price,
      supplier,
      stock_level,
      supplier_id
    )
    =
    (
      $1, $2, $3, $4, $5, $6
      ) WHERE id = $7"
      values = [@name, @buy_cost, @sell_price, @supplier, @stock_level, @supplier_id, @id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM drinks"
      return map_drinks(SqlRunner.run(sql))
    end

    def self.find(id)
      sql = "SELECT * FROM drinks
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first()
      return Drink.new(result)
    end

    def self.delete_all()
      sql = "DELETE FROM drinks"
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM drinks
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def add_stock(num)
      sql = "UPDATE stock_level FROM drinks SET stock_level = stock_level + $1
      WHERE id = $2"
      values = [num, @id]
    end

    #Helper methods to be used throughout the code
    def self.map_drinks(drink_data)
      return drink_data.map { |drink| Drink.new(drink)}
    end

  end
