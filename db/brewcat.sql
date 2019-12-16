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
  supplier VARCHAR(255),
  stock_level INT,
  supplier_id INT REFERENCES suppliers(id) ON DELETE CASCADE
);
