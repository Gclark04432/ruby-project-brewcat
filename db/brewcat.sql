DROP TABLE promotions;
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
  buy_cost DECIMAL(6,2),
  sell_price DECIMAL(6,2),
  supplier VARCHAR(255),
  stock_level INT,
  supplier_id INT REFERENCES suppliers(id) ON DELETE CASCADE
);

CREATE TABLE promotions (
  id SERIAL PRIMARY KEY,
  supplier_id INT REFERENCES suppliers(id) ON DELETE CASCADE,
  drink_id INT REFERENCES drinks(id) ON DELETE CASCADE,
  percentage INT2
);
