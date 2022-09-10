create database if not exists first_example;
use first_example;
create table person(
    person_id smallint unsigned,
    fname varchar(20),
    lname varchar(20),
    gender enum('M','F'),
    birth_date date,
    street varchar(30),
    city varchar(20),
    state varchar(20),
    country varchar(20),
    postal_code varchar(20),
    constraint pk_person primary key (person_id)
);
create table favorite_food(
    person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key (person_id, food),
    constraint fk_favorite_food_person_id foreign key (person_id) references person(person_id)
);

select * from information_schema.table_constraints
where constraint_schema = 'first_example';

insert into person values ('5', 'Roberta', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'),
('6','Luiz','Silva','M', '1979-08-21','rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89');

delete from person where person_id=5;

insert into favorite_food values(6,'Carne')

select * from favorite_food;

select * from person;

INSERT INTO person (person_id, fname, lname, gender, birth_date) VALUES (1, 'William','Turner', 'M', '1972-05-27');
INSERT INTO favorite_food (person_id, food) VALUES (1, 'pizza');
INSERT INTO favorite_food (person_id, food) VALUES (1, 'cookies');
INSERT INTO favorite_food (person_id, food) VALUES (1, 'nachos');

INSERT INTO person (person_id, fname, lname, gender, birth_date, street, city, state, country, postal_code) 
	VALUES (2, 'Susan','Smith', 'F', '1975-11-02', '23 Maple St.', 'Arlington', 'VA', 'USA', '20220');


SELECT person_id, fname, lname, birth_date FROM person WHERE person_id = 1;
SELECT person_id, fname, lname, birth_date FROM person WHERE lname = 'Turner';