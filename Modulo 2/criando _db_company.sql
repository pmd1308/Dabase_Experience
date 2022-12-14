--create dabase company
    create schema if not exists company;
    use company;
--create tables 
    create table employee(
            Fname varchar(15) not null,
            Minit char,
            Lname varchar(15) not null,
            Ssn char(9) not null,
            Bdate date,
            Address varchar(30),
            Sex char,
            Salary decimal(10,2),
            Super_ssn char(9) not null,
            Dno int not null default 1,
            constraint fk_employee foreign key(Super_ssn) references (Ssn)
            constraint pk_employee primary key (Ssn)
            constraint fk_dept foreign key(Dno) references departament(Dnumber)
        );

        
    create table departament(
            Dname varchar(15) not null,
            Dnumber int not null,
            Mgr_ssn char(9) not null,
            Mgr_start_date date,
            Dept_create_date date,
            constraint chk_dept_date check (Dept_create_date <= Mgr_start_date),
            constraint chk_dept_date check (Dept_create_date <> 0),
            constraint pk_dept primary key (Dnumber),
            constraint unique_name_dept unique(Dname),
            constraint fk_dept foreign key (Mgr_ssn) references employee(Ssn)
        );

        
    create table dept_locations(
            Dnumeber int not null,
            Dlocation varchar (15) not null,
            constraint primary key (Dnumber, Dlocation),
            constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
        );

        
                
    create table project(
            Pname varchar(15) not null,
            Pnumber int not null,
            Plocation varchar(15),
            Dnum int not null,
            constraint pk_project primary key (Pnumber),
            constraint unique_name_dept unique (Pnumber),
            constraint fk_project foreign (Dnum) references departament(Dnumber)
        );
        

    create table works_on(
            Essn char(9) not null,
            Pno int not null,
            Hours decimal(3,1)not null
            primary key (Essn, Pno),
            constraint fk_works_on foreign key (Essn) references departament(Ssn),
            foreign key (Pno) references project(Pnumber)
        );
            
    create table dependent(
        Essn char(9) not null,
        dependent_name varchar(255) not null,
        Sex char,
        Bdate date,
        Age int,
        Relationship varchar(8) not null,
        constraint chk_age_dependent check (age < 21),
        constraint pk_dependent primary key(Essn, dependent_name),
        constraint fk_dependent foreign (Essn) references employee(Ssn)
    );
--alter table
    alter table works_on
        on update cascade;
    alter table dept_locations 
        on update cascade;
    alter table dept_locations 
        on update cascade;
    alter table departament 
        drop constraint fk_dept
        on update cascade;
    alter table employee
        on update cascade;
            

select * from information_schema.table_constraints 
    where (constraint_schema = 'company');
