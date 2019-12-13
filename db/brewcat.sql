DROP TABLE drinks;
DROP TABLE suppliers;

CREATE TABLE suppliers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  supplier_code VARCHAR(255),
  preferred BOOLEAN,
  promotion BOOLEAN
);

CREATE TABLE drinks (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  buy_cost MONEY,
  supplier VARCHAR(255),
  product_type VARCHAR(255),
  product_code VARCHAR(255),
  promotion BOOLEAN,
  supplier_id INT REFERENCES suppliers(id)
);
