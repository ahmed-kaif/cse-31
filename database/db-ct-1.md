% Database Note 
% Kaif Ahmed Khan

# Primary Key
CustomerID
ProductID
OrderID
OrderID, ProductID
PaymentID

# Foreign Key
X
X
CustomerID
OrderID,ProductID
OrderID

# Candidate Keys
Email

# Explain data integrity of DBMS

# Role of integrity constraints: Primary and Foreign
**Primary Key:** are not null and unique. No tuple can have null
value for primary key attribute. and no two tuple can have the 
same value for the primary key attribute

**Foreign Key:** foreign keys specifies that for any tuple in the
relation correspond to the values of the primary key attributes 
of some tuple in the relation S.
e.g. `foreign key (dept_name) references department`

# Define Tuple, Relation, Attributes, Null Values, DB Schema, Instance

**Tuple:** In mathematical terminology, tuple is simply a sequence or list
of values
**Relation:** In relational model,Relation is a table
Atrributes: In RDBMS, Attributes are the columns in a table/relation.
**Null Values:** It signifies that the value is unknown or doesn't exist.
**DB Schema:** Logical design of the DB. Schema doesn't generally change.
**DB Instance:** Snapshot of the DB at a given instant time.
**Super Key:** Set of one or more Attributes that, uniquely identifies 
a tuple in a relation.
**Candidate Keys:** Minimal super keys are called the Candidate keys.


# Schema Definition

## Table Creation
```sql
create table department (
dept_name varchar(20),
building varchar(15),
budget  numeric(12,2),
primary key (dept_name)
);
-- Foreign key relation
create table course
(course id varchar (7),
title varchar (50),
dept_name varchar (20),
credits numeric (2,0),
primary key (course id),
foreign key (dept name) references department);

-- Example: All the keys are from other table
create table teaches
(ID varchar (5),
course_id varchar (8),
sec_id varchar (8),
semester varchar (6),
year numeric (4,0),
primary key (ID, course id, sec id, semester, year),
foreign key (course id, sec id, semester, year) references section,
foreign key (ID) references instructor);
```

## Alter Table
```sql
alter table student add column total_credit numeric(5,2);
alter table student drop column cgpa
```

