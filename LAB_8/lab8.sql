-- Task 1
-- a
create function increment(n integer)
    returns integer
    language plpgsql
    as
$$
declare n_new integer;
begin
    n_new = n + 1;
return n_new;
end
$$;

select increment(5);

--b
create function sum_of_two_numbers(a integer, b integer)
    returns integer
    language plpgsql
    as
$$
declare result integer;
begin
    result = a + b;
    return result;
end;
$$;

select sum_of_two_numbers(101, 2);

--c
create or replace function is_divisible_by_two(n integer)
    returns boolean
    language plpgsql
    as
$$
declare result boolean;
begin
    if n%2 = 0 then
        result = true;
    else
        result = false;
    end if;
    return result;
end;
$$;

select is_divisible_by_two(22);

--d
create or replace function is_valid_password(p varchar(20))
    returns boolean
    language plpgsql
    as
$$
declare result boolean;
begin
    if p ~ '^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$' then
        result = true;
    else
        result = false;
    end if;
    return result;
end
$$;

select is_valid_password('Aruzhan@');

--e
create or replace function one_to_two(s varchar(30))
    returns record
    language plpgsql
    as
$$
declare rec record;
begin
    select split_part(s, ' ', 1) f,
           split_part(s, ' ', 2) s2
           into rec;
    return rec;
end;
$$;

select one_to_two('Aruzhan Kubayeva');

-- Task 2
--a
create table person(
    id serial primary key,
    name varchar(20) not null,
    city varchar(20),
    phone numeric,
    last_updated timestamp
);

insert into person(name, city, phone) values('John', 'New York', 891);
insert into person(name, city, phone) values('Sara', 'Rio', 667);
insert into person(name, city, phone) values('Aruzhan', 'Almaty', 476);

create or replace function customer_change() returns trigger as $$
begin
    new.last_updated = now();
    return new;
end;
$$ language plpgsql;

create trigger person_timestamp before insert or update on person
    for each row execute procedure customer_change();

select * from person where id=1;

insert into person(name, city, phone) values('Gulnaz', 'Astana', 776);

update person
set city='New ---- Orleans'
where id=1;

--b
create table student(
    id serial primary key,
    name varchar(20),
    birth_year integer not null ,
    age integer
);

select extract(year from current_date);

create or replace function age_calculate()
    returns trigger
    language plpgsql
    as
$$
    begin
        new.age = extract(year from current_date) - new.birth_year;
        return new;
    end;
$$;

create trigger age_from_year before insert or update on student
    for each row execute procedure age_calculate();

insert into student(name, birth_year) values ('Aruzhan', 2003);
insert into student(name, birth_year) values ('Gulnaz', 2002);
insert into student(name, birth_year) values ('John', 1996);

update student set birth_year=2002 where id=2;

select *
from student;

-- c

create table fruits(
    id serial primary key,
    name varchar(20),
    price numeric,
    total_price numeric
);

insert into fruits (name, price) values ('Apple', 589.9);

create or replace function add_tax()
    returns trigger
    language plpgsql
    as
$$
    begin
        new.total_price = new.price + (new.price * 0.12);
        return new;
    end;
$$;

create trigger total_price_tax before insert or update on fruits
    for each row execute procedure add_tax();

insert into fruits(name, price) values ('Orange', 700);
insert into fruits(name, price) values ('Banane', 599.0);

update fruits set price=456.5 where id=1;

select *
from fruits;

-- d
create function not_delete()
    returns trigger
    language plpgsql
    as
$$
    begin
    raise exception 'Cannot delete that!';
    end;
$$;

create trigger undo_delete before delete on fruits
    for each row execute procedure not_delete();

delete
from fruits
where id=1;

-- Task 3
/*
1.The procedure allows SELECT as well as
DML(INSERT/UPDATE/DELETE) statement in it
whereas Function allows only SELECT statement in it.
2.Procedures cannot be utilized in a SELECT statement
whereas Function can be embedded in a SELECT statement.
*/

-- Task 4
create table employee(
    id serial primary key,
    name varchar(30),
    date_of_birth date,
    age integer,
    salary integer,
    work_experience integer,
    discount integer
);

insert into employee(name, date_of_birth, age, salary, work_experience, discount)
values ('John', '1990-01-02' , 35, 2700, 3, 0);

select *
from employee;
-- a
create procedure salary_inc()
    language plpgsql
    as
$$
    begin
        update employee set salary = salary + (salary*0.1) where work_experience / 2 > 0;
        update employee set discount = discount + salary*0.1 where work_experience / 2 > 0;
        update employee set discount = discount + salary*0.01 where work_experience  > 5;
    end;
$$;

-- b
create procedure b()
    language plpgsql
    as
$$
    begin
        update employee set salary = salary + (salary*0.15) where age > 40;
        update employee set salary = salary + (salary*0.15) where work_experience > 8;
        update employee set discount = discount + (discount*0.20) where work_experience > 8;
    end;
$$;

call salary_inc();
call b();

-- Task 5
create table members (
    memid integer primary key NOT NULL,
    surname character varying(200) NOT NULL,
    firstname character varying(200) NOT NULL,
    address character varying(300) NOT NULL,
    zipcode integer NOT NULL,
    telephone character varying(20) NOT NULL,
    recommendedby integer references members(memid),
    joindate timestamp NOT NULL
);

create table facilities (
    facid integer primary key NOT NULL,
    name character varying(100) NOT NULL,
    membercost numeric NOT NULL,
    guestcost numeric NOT NULL,
    initialoutlay numeric NOT NULL,
    monthlymaintenance numeric NOT NULL
);

create table bookings (
    facid integer references facilities(facid) NOT NULL,
    memid integer references members(memid) NOT NULL,
    starttime timestamp NOT NULL,
    slots integer NOT NULL
);

INSERT INTO members (memid, surname, firstname, address, zipcode, telephone, recommendedby, joindate) VALUES
(1, 'Smith', 'Darren', '8 Bloomsbury Close, Boston', 4321, '555-555-5555', NULL, '2012-07-02 12:02:05'),
(2, 'Smith', 'Tracy', '8 Bloomsbury Close, New York', 4321, '555-555-5555', NULL, '2012-07-02 12:08:23'),
(3, 'Rownam', 'Tim', '23 Highway Way, Boston', 23423, '(844) 693-0723', NULL, '2012-07-03 09:32:15'),
(4, 'Joplette', 'Janice', '20 Crossing Road, New York', 234, '(833) 942-4710', 1, '2012-07-03 10:25:05'),
(5, 'Butters', 'Gerald', '1065 Huntingdon Avenue, Boston', 56754, '(844) 078-4130', 1, '2012-07-09 10:44:09'),
(6, 'Tracy', 'Burton', '3 Tunisia Drive, Boston', 45678, '(822) 354-9973', NULL, '2012-07-15 08:52:55'),
(7, 'Dare', 'Nancy', '6 Hunting Lodge Way, Boston', 10383, '(833) 776-4001', 4, '2012-07-25 08:59:12'),
(8, 'Boothe', 'Tim', '3 Bloomsbury Close, Reading, 00234', 234, '(811) 433-2547', 3, '2012-07-25 16:02:35'),
(9, 'Stibbons', 'Ponder', '5 Dragons Way, Winchester', 87630, '(833) 160-3900', 6, '2012-07-25 17:09:05'),
(10, 'Owen', 'Charles', '52 Cheshire Grove, Winchester, 28563', 28563, '(855) 542-5251', 1, '2012-08-03 19:42:37'),
(11, 'Jones', 'David', '976 Gnats Close, Reading', 33862, '(844) 536-8036', 4, '2012-08-06 16:32:55'),
(12, 'Baker', 'Anne', '55 Powdery Street, Boston', 80743, '844-076-5141', 9, '2012-08-10 14:23:22'),
(13, 'Farrell', 'Jemima', '103 Firth Avenue, North Reading', 57392, '(855) 016-0163', NULL, '2012-08-10 14:28:01'),
(14, 'Smith', 'Jack', '252 Binkington Way, Boston', 69302, '(822) 163-3254', 1, '2012-08-10 16:22:05'),
(15, 'Bader', 'Florence', '264 Ursula Drive, Westford', 84923, '(833) 499-3527', 9, '2012-08-10 17:52:03'),
(16, 'Baker', 'Timothy', '329 James Street, Reading', 58393, '833-941-0824', 13, '2012-08-15 10:34:25'),
(17, 'Pinker', 'David', '5 Impreza Road, Boston', 65332, '811 409-6734', 13, '2012-08-16 11:32:47'),
(20, 'Genting', 'Matthew', '4 Nunnington Place, Wingfield, Boston', 52365, '(811) 972-1377', 5, '2012-08-19 14:55:55'),
(21, 'Mackenzie', 'Anna', '64 Perkington Lane, Reading', 64577, '(822) 661-2898', 1, '2012-08-26 09:32:05'),
(22, 'Coplin', 'Joan', '85 Bard Street, Bloomington, Boston', 43533, '(822) 499-2232', 16, '2012-08-29 08:32:41'),
(24, 'Sarwin', 'Ramnaresh', '12 Bullington Lane, Boston', 65464, '(822) 413-1470', 15, '2012-09-01 08:44:42'),
(26, 'Jones', 'Douglas', '976 Gnats Close, Reading', 11986, '844 536-8036', 11, '2012-09-02 18:43:05'),
(27, 'Rumney', 'Henrietta', '3 Burkington Plaza, Boston', 78533, '(822) 989-8876', 20, '2012-09-05 08:42:35'),
(28, 'Farrell', 'David', '437 Granite Farm Road, Westford', 43532, '(855) 755-9876', NULL, '2012-09-15 08:22:05'),
(29, 'Worthington-Smyth', 'Henry', '55 Jagbi Way, North Reading', 97676, '(855) 894-3758', 2, '2012-09-17 12:27:15'),
(30, 'Purview', 'Millicent', '641 Drudgery Close, Burnington, Boston', 34232, '(855) 941-9786', 2, '2012-09-18 19:04:01');

with recursive recommenders(recommender, member) as (
	select recommendedby, memid
		from members
	union all
	select mems.recommendedby, recs.member
		from recommenders recs
		inner join members mems
			on mems.memid = recs.recommender
)

select recs.member member, recs.recommender, mems.firstname, mems.surname
	from recommenders recs
	inner join members mems
		on recs.recommender = mems.memid
	where recs.member = 22 or recs.member = 12
order by recs.member asc, recs.recommender desc
