create table customers (
    id integer primary key,
    name varchar(255),
    birth_date date
);

create table accounts(
    account_id varchar(40) primary key ,
    customer_id integer references customers(id),
    currency varchar(3),
    balance float,
    "limit" float
);

create table transactions (
    id serial primary key ,
    date timestamp,
    src_account varchar(40) references accounts(account_id),
    dst_account varchar(40) references accounts(account_id),
    amount float,
    status varchar(20)
);

INSERT INTO customers VALUES (201, 'John', '2021-11-05');
INSERT INTO customers VALUES (202, 'Anny', '2021-11-02');
INSERT INTO customers VALUES (203, 'Rick', '2021-11-24');

INSERT INTO accounts VALUES ('NT10204', 201, 'KZT', 1000, null);
INSERT INTO accounts VALUES ('AB10203', 202, 'USD', 100, 0);
INSERT INTO accounts VALUES ('DK12000', 203, 'EUR', 500, 200);
INSERT INTO accounts VALUES ('NK90123', 201, 'USD', 400, 0);
INSERT INTO accounts VALUES ('RS88012', 203, 'KZT', 5000, -100);

INSERT INTO transactions VALUES (1, '2021-11-05 18:00:34.000000', 'NT10204', 'RS88012', 1000, 'commited');
INSERT INTO transactions VALUES (2, '2021-11-05 18:01:19.000000', 'NK90123', 'AB10203', 500, 'rollback');
INSERT INTO transactions VALUES (3, '2021-06-05 18:02:45.000000', 'RS88012', 'NT10204', 400, 'init');



CREATE ROLE accountant;
CREATE ROLE administrator;
CREATE ROLE support;
-- Drop ROLE accountant;
-- Drop ROLE administrator;
-- Drop ROLE support;


GRANT SELECT ON transactions TO accountant;
GRANT SELECT, UPDATE (balance) ON accounts TO accountant;
GRANT SELECT ON accounts,customers,transactions TO support;
select * FROM pg_roles;
CREATE USER A1;
CREATE USER A2;
CREATE USER A3;
-- DROP USER A1;
-- DROP USER A2;
-- DROP USER A3;

GRANT accountant TO A2;
GRANT administrator TO A1;
GRANT support TO A3;

CREATE ROLE role_manager CREATEROLE;
GRANT role_manager to A1;

REVOKE UPDATE ON accounts FROM accountant;


--3
ALTER TABLE transactions
ALTER COLUMN src_account SET NOT NULL;
ALTER TABLE transactions
ALTER COLUMN dst_account SET NOT NULL;
ALTER TABLE transactions
ALTER COLUMN amount SET NOT NULL;
ALTER TABLE transactions
ALTER COLUMN status SET NOT NULL;


--5
CREATE UNIQUE INDEX idx_acc ON accounts(customer_id, currency);
CREATE INDEX search_t ON accounts(currency, balance);


--6
DO
$$
    DECLARE
        bal INT;
        lim INT;
    BEGIN
        UPDATE transactions SET status = 'init'
        WHERE id = 2;
        UPDATE accounts
        SET balance = balance - 400
        WHERE account_id = 'NK90123';
        UPDATE accounts
        SET balance = balance + 400
        WHERE account_id = 'AB10203';
        SELECT balance INTO bal FROM accounts
        WHERE account_id = 'NK90123';
        SELECT accounts.limit INTO lim FROM accounts
        WHERE account_id = 'NK90123';
        IF bal < lim THEN
            UPDATE transactions SET status = 'rollback' WHERE id = 2;
        ELSE
            COMMIT;
            UPDATE transactions SET status = 'commited' WHERE id = 2;
        END IF;
    END
$$
