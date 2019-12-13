require_relative ('../db/sql_runner')

class Supplier

  attr_reader :id
  attr_accessor :name, :preferred, :promotion, :supplier_code

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

  def update()
    sql = "UPDATE suppliers SET
    (
      name,
      supplier_code,
      preferred,
      promotion
      ) = (
        $1, $2, $3, $5
        ) WHERE id = $5"
        values = [@name, @supplier_code, @preferred, @promotion, @id]
        SqlRunner.run(sql, values)
      end

      def self.all
        sql = "SELECT * FROM suppliers"
        return map_suppliers(SqlRunner.run(sql))
      end

      def self.find(id)
        sql = "SELECT * FROM suppliers
        WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values).first()
        return Supplier.new(result)
      end

      def self.delete_all
        sql = "DELETE FROM suppliers"
        SqlRunner.run(sql)
      end

      def delete()
        sql = "DELETE FROM suppliers
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
      end

      #Helper methods to be used throughout the code
      def self.map_suppliers(supplier_data)
        return  supplier_data.map { |supplier| Supplier.new(supplier)}
      end

    end
