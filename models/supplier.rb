require_relative ('../db/sql_runner')

class Supplier

  attr_reader :id
  attr_accessor :name, :supplier_code

  def initialize(options)
    @name = options['name']
    @supplier_code = options['supplier_code']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO suppliers
    (
      name,
      supplier_code
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @supplier_code]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE suppliers SET
    (
      name,
      supplier_code
      ) = (
        $1, $2
        ) WHERE id = $3"
        values = [@name, @supplier_code, @id]
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
