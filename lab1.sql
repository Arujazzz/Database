CREATE TABLE employee(
    id BIGSERIAL PRIMARY KEY ,
    person_name VARCHAR,
    street VARCHAR,
    city VARCHAR
)

CREATE TABLE works(
    id BIGSERIAL PRIMARY KEY,
    person_name VARCHAR,
    company_name VARCHAR,
    salary INTEGER
)

CREATE TABLE company(
    id BIGSERIAL PRIMARY KEY,
    company_name VARCHAR,
    city VARCHAR
)

INSERT INTO employee(person_name, street, city) VALUES ('person_1', 'street_1', 'city_1');
INSERT INTO employee(person_name, street, city) VALUES ('person_2', 'street_2', 'city_2');
INSERT INTO employee(person_name, street, city) VALUES ('person_3', 'street_3', 'city_3');
INSERT INTO employee(person_name, street, city) VALUES ('person_4', 'street_4', 'city_2');
INSERT INTO employee(person_name, street, city) VALUES ('person_5', 'street_5', 'city_1');

INSERT INTO works(person_name, company_name, salary) VALUES ('person_1', 'bigbank', '12000');
INSERT INTO works(person_name, company_name, salary) VALUES ('person_2', 'company_2', '9000');
INSERT INTO works(person_name, company_name, salary) VALUES ('person_3', 'company_3', '20000');
INSERT INTO works(person_name, company_name, salary) VALUES ('person_4', 'bigbank', '10000');
INSERT INTO works(person_name, company_name, salary) VALUES ('person_5', 'bigbank', '15000');

INSERT INTO company (company_name, city) VALUES ('bigbank', 'city_1');
INSERT INTO company (company_name, city) VALUES ('bigbank', 'city_2');
INSERT INTO company (company_name, city) VALUES ('company_2', 'city_2');
INSERT INTO company (company_name, city) VALUES ('company_3', 'city_3');
INSERT INTO company (company_name, city) VALUES ('company_2', 'city_1');

SELECT id, person_name FROM works WHERE company_name = 'bigbank';
SELECT employee.id, employee.person_name, employee.city FROM employee, works WHERE employee.person_name = works.person_name AND works.company_name = 'bigbank';
SELECT employee.id, employee.person_name, employee.street, employee.city FROM employee, works WHERE employee.person_name = works.person_name AND works.company_name = 'bigbank' AND works.salary > 10000;


SELECT id, person_name FROM works WHERE company_name != 'bigbank';
SELECT AVG(salary) FROM works;
SELECT id, person_name FROM works WHERE salary > (SELECT AVG(salary) FROM works);
