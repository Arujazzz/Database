--TASK_2
CREATE TABLE customers(
    id INTEGER PRIMARY KEY,
    full_nam VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    delivery_address TEXT NOT NULL
);

CREATE TABLE products(
    id VARCHAR PRIMARY KEY,
    name VARCHAR UNIQUE   NOT NULL,
    description TEXT,
    price DOUBLE PRECISION NOT NULL CHECK (price > 0)
);

CREATE TABLE orders(
    code INTEGER PRIMARY KEY,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE,
    total_sum DOUBLE PRECISION NOT NULL CHECK (total_sum > 0),
    is_paid BOOLEAN NOT NULL
);

CREATE TABLE order_items(
    order_code INTEGER UNIQUE NOT NULL,
    product_id VARCHAR UNIQUE NOT NULL,
    FOREIGN KEY (order_code) REFERENCES orders (code) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_code, product_id)
);

--TASK_3


CREATE TABLE students(
    full_name VARCHAR PRIMARY KEY,
    age INTEGER NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR NOT NULL,
    gpa NUMERIC NOT NULL,
    information TEXT,
    dormitory BOOLEAN,
    add_info TEXT
);

CREATE TABLE instructors(
    full_name VARCHAR PRIMARY KEY,
    work_exp TEXT,
    on_or_off BOOLEAN
);

CREATE TABLE languages(
    instructor_name VARCHAR,
    language_name VARCHAR,
    PRIMARY KEY (instructor_name, language_name),
    FOREIGN KEY (instructor_name) REFERENCES instructors(full_name)
);

CREATE TABLE lessons(
    lesson_tittle VARCHAR,
    instructor VARCHAR,
    room_number INTEGER,
    PRIMARY KEY (lesson_tittle, instructor),
    FOREIGN KEY (instructor) REFERENCES instructors(full_name)
);

CREATE TABLE study_students(
    full_name VARCHAR,
    study_lesson VARCHAR,
    instructor VARCHAR,
    PRIMARY KEY (full_name, study_lesson),
    FOREIGN KEY (study_lesson, instructor) REFERENCES lessons,
    FOREIGN KEY (full_name) REFERENCES students(full_name)
);

--TASK_4

INSERT INTO customers VALUES (1, 'Kubayeva Aruzhan', '2021-09-23 14:20:50', 'Stepnaya 4');
INSERT INTO orders VALUES (1, 1, 100, TRUE);
INSERT INTO products VALUES (1, 'water', 'from city_XXX', 100);
INSERT INTO order_items VALUES (1, 1, 1);

UPDATE customers SET delivery_address = 'Turgut Ozal 80' WHERE id = 1;
UPDATE orders SET total_sum = 200 WHERE customer_id = 1;
UPDATE products SET price = 1000 WHERE id = 1;
UPDATE order_items SET  quantity = 5 WHERE order_code = 1;

DELETE FROM customers WHERE id = 1;
DELETE FROM orders WHERE code = 1;
DELETE FROM products WHERE name = 'water';
DELETE FROM order_items WHERE order_code = 1;
