DROP TABLE drinks;
DROP TABLE suppliers;

CREATE TABLE suppliers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  supplier_code VARCHAR(255),
  active BOOLEAN
);

CREATE TABLE drinks (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  buy_cost MONEY,
  product_type VARCHAR(255),
  product_code VARCHAR(255),
  supplier VARCHAR(255),
  supplier_id INT REFERENCES suppliers(id) ON DELETE CASCADE
);
