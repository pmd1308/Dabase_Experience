use company_constraints;
--Inserindo valores
    insert into employee values 
                                ('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, 333445555, 5),
                                ('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 888665555, 5),
                                ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 987654321, 4),
                                ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, 888665555, 4),
                                ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 333445555, 5),
                                ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 333445555, 5),
                                ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 987654321, 4),
                                ('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1);

    insert into dependent values 
                                (333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
                                (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
                                (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
                                (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
                                (123456789, 'Michael', 'M', '1988-01-04', 'Son'),
                                (123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
                                (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');

    insert into departament values 
                                ('Research', 5, 333445555, '1988-05-22','1986-05-22'),
                                ('Administration', 4, 987654321, '1995-01-01','1994-01-01'),
                                ('Headquarters', 1, 888665555,'1981-06-19','1980-06-19');

    insert into dept_locations values 
                                    (1, 'Houston'),
                                    (4, 'Stafford'),
                                    (5, 'Bellaire'),
                                    (5, 'Sugarland'),
                                    (5, 'Houston');

    insert into project values 
                            ('ProductX', 1, 'Bellaire', 5),
                            ('ProductY', 2, 'Sugarland', 5),
                            ('ProductZ', 3, 'Houston', 5),
                            ('Computerization', 10, 'Stafford', 4),
                            ('Reorganization', 20, 'Houston', 1),
                            ('Newbenefits', 30, 'Stafford', 4)
    ;

    insert into works_on values 
                                (123456789, 1, 32.5),
                                (123456789, 2, 7.5),
                                (666884444, 3, 40.0),
                                (453453453, 1, 20.0),
                                (453453453, 2, 20.0),
                                (333445555, 2, 10.0),
                                (333445555, 3, 10.0),
                                (333445555, 10, 10.0),
                                (333445555, 20, 10.0),
                                (999887777, 30, 30.0),
                                (999887777, 10, 10.0),
                                (987987987, 10, 35.0),
                                (987987987, 30, 5.0),
                                (987654321, 30, 20.0),
                                (987654321, 20, 15.0),
                                (888665555, 20, 0.0);

-- Consultas SQL

    select * from employee;

    -- gerente e seu departamento 
        select Ssn, Fname, Dname from employee e, departament d where (e.Ssn = d.Mgr_ssn);

    -- recuperando dependentes dos empregrados
        select Fname, Dependent_name, Relationship from employee, dependent where Essn = Ssn;


        select Bdate, Address from employee
            where Fname = 'John' and Minit='B' and Lname='Smith';

    -- recuperando departamento específico
        select * from departament where Dname = 'Research';

        select Fname, Lname, Address from employee, departament
            where Dname='Research' and Dnumber=Dno;
            
        desc works_on;
        select * from project;

        select Pname, Essn, Fname, Hours  
        from project, works_on, employee 
            where Pnumber = Pno and Essn = Ssn;



-- Expressões e concatenação de strings
    desc dept_locations;
    select * from dept_locations;
     -- recuperando informações dos departmentos presenttes em Stafford
        select Dname as Department_Name, Mgr_ssn as Manager, Address from departament d, dept_locations l, employee e
            where d.Dnumber = l.Dnumber and Dlocation='Stafford';

    -- recuperando todos os gerentes que trabalham em Stafford
        select Dname as Department_Name, concat(Fname, ' ', Lname) as Manager from departament d, dept_locations l, employee e
            where d.Dnumber = l.Dnumber and Dlocation='Stafford' and Mgr_ssn = e.Ssn;

        desc departament;
    -- recuperando todos os gerentes, departamentos e seus nomes
        select Dname as Department_Name, concat(Fname, ' ', Lname) as Manager, Dlocation  from departament d, dept_locations l, employee e
            where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

        desc project;
        select Pnumber, Dnum, Lname, Address, Bdate from departament d, project p, employee e
            where d.Dnumber = p.Dnum and p.Plocation='Stafford' and Mgr_ssn = e.Ssn;
            

        SELECT * FROM employee WHERE Dno IN (3,6,9);

    
--Operadores lógicos
    select Bdate, Address from employee where Fname='John' and Minit='B' and Lname='Smith';
    select * from departament;
    select * from departament where Dname = 'Research' or Dname = 'Administration';

    select Fname, Lname from employee, departament where Dname = 'Research' and Dnumber=Dno;
    select concat(Fname, Lname) as Complete_name from employee, departament where Dname = 'Research' and Dnumber=Dno;


-- Expressões e alias
    -- recolhendo o valor do INSS-*
        select Fname, Lname, Salary, Salary*0.011 from employee;
        select Fname, Lname, Salary, Salary*0.011 as INSS from employee;
        select Fname, Lname, Salary, round(Salary*0.011,2) as INSS from employee;

        select * 
            from employee e, works_on as w, project as p
            where (e.Ssn = w.Essn and w.Pno=p.Pnumber);
            
        select concat(Fname, ' ', Lname) as Complete_name, Salary, Salary*1.1 as increased_salary
            from employee e, works_on as w, project as p
            where (e.Ssn = w.Essn and w.Pno=p.Pnumber and p.Pname='ProductX');
            
        select e.Fname, e.Lname, 1.1*e.Salary as increased_sal from employee as e,
        works_on as w, project as p where e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname='ProductX';

    -- definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX
        select concat(Fname, ' ', Lname) as Complete_name, Salary, round(1.1*Salary,2) as increased_salary
            from employee e, works_on as w, project as p
            where (e.Ssn = w.Essn and w.Pno=p.Pnumber and p.Pname='ProductX');
            
    -- concatenando e fornecendo alias
        select Dname as Department, concat(Fname, ' ', Lname) as Manager from departament d, dept_locations l, employee e
        where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

    -- recuperando dados dos empregados que trabalham para o departamento de pesquisa
        select Fname, Lname, Address from employee, departament
            where Dname = 'Research' and Dnumber = Dno;

    -- definindo alias para legibilidade da consulta
        select e.Fname, e.Lname, e.Address from employee e, departament d
            where d.Dname = 'Research' and d.Dnumber = e.Dno;

    -- like e between

        desc employee;
        select * from project;
        select concat(Fname, ' ', Lname) as Complete_Name, Dname as Department_Name, Address 
            from employee, departament where Dno = Dnumber and Address like '%Houston%';
        select Fname, Lname from employee where (Salary > 3000.00 and Salary < 40000);
        select Fname, Lname from employee where (Salary between 20000 and 40000);
