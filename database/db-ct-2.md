% Database CT 2 Note 
% Kaif Ahmed Khan

# Join Expressions

## Left Outer Join
- Find the actor name, no of films and no of awards of the actors who didn't
directed any movie.
```sql
select Actor_Name, A.No_Of_Films, A.No_Of_Awards from actor A 
left outer join director D using (Person_ID) where D.Person_ID is null;
```

- All the actors are listed with their director role on the right
```sql
select * from actor A left outer join director D using (Person_ID);
```

## Right Outer Join
- Find only director 
```sql
select Director_Name, D.No_Of_Films, D.No_Of_Awards from actor A 
right outer join director D using (Person_ID) where A.Person_ID is null;
```

- All directors are listed with their corresponding actor rows
```sql
select * from actor A right outer join director D using (Person_ID);
```


## Full Outer Join
```sql
select coalesce(A.Actor_Name, D.Director_Name) as Name,
A.No_Of_Awards as Actor_Awards,
A.No_Of_Films as Actor_Films,
D.No_Of_Awards as Director_Awards,
D.No_Of_Films as Directed_Films  from actor A left outer join director D using (Person_ID)
union
select coalesce(A.Actor_Name, D.Director_Name) as Name,
A.No_Of_Awards as Actor_Awards, 
A.No_Of_Films as Actor_Films, 
D.No_Of_Awards as Director_Awards,
D.No_Of_Films as Directed_Films  from actor A right outer join director D using (Person_ID)
```



# Nested Sub-queries

A nested sub-query is a select-from-where expression that is nested in another query.

Use case:
- Check set membership
- Set comparison
- Set Cardinality

## Some Common Phrase and SQL Construct

**Greater than at least one** -> `> Some`
“Find the names of all instructors whose salary is greater than at least one instructor
in the Biology department.”
```sql 
select name
from instructor
where salary > some (select salary
from instructor
where dept name = 'Biology');
```

**Greater than all** -> `> all`


# Set Operations


# From ChatGPT
---

## **What is a Natural Join?**

In SQL, a **Natural Join** is a type of `JOIN` that automatically matches and combines rows from two tables based on all columns with the same name **and** compatible data types in both tables.

- You **do not** need to specify the joining condition (`ON` clause).
- SQL automatically matches columns with the **same names** and **joins** on them.

The result contains:
- One copy of each matching column (not duplicated),
- Plus all the non-matching columns from both tables.

---

### **When Should You Use a Natural Join?**

Use **Natural Join** when:
- **Both tables have columns with the same names** that you want to match on.
- The **matching columns represent the same data** (e.g., IDs, foreign keys).
- You want a **cleaner query** without manually specifying the join condition.

**But be careful**:
- If **column names are accidentally the same but mean different things**, Natural Join can cause wrong results.
- If new columns are added in the future with matching names, your query might break or behave differently.

---

### **Example**

Suppose we have two tables:

```sql
-- Table: Students
+---------+----------+-----------+
| student_id | name  | major     |
+---------+----------+-----------+
| 1       | Alice    | CS        |
| 2       | Bob      | EE        |
+---------+----------+-----------+

-- Table: Enrollments
+---------+----------+
| student_id | course |
+---------+----------+
| 1       | Math101   |
| 2       | Phys201   |
+---------+----------+
```

A Natural Join between `Students` and `Enrollments`:

```sql
SELECT * 
FROM Students
NATURAL JOIN Enrollments;
```

**Result:**

```sql
+------------+--------+--------+---------+
| student_id | name   | major  | course  |
+------------+--------+--------+---------+
| 1          | Alice  | CS     | Math101 |
| 2          | Bob    | EE     | Phys201 |
+------------+--------+--------+---------+
```

Notice:
- It automatically joined using `student_id`.
- `student_id` is shown only once in the output.

---

### **Summary Table**

| Aspect                | Natural Join                            |
|------------------------|-----------------------------------------|
| Matching               | Based on column names and types         |
| Need to specify `ON`?  | No                                      |
| Advantages             | Simpler, less typing                   |
| Risks                  | Ambiguity if new columns added, or wrong matches |

---

## **Difference Between JOIN and NATURAL JOIN**

| Feature                  | JOIN (e.g., INNER JOIN)                           | NATURAL JOIN                        |
|---------------------------|---------------------------------------------------|-------------------------------------|
| Matching Columns          | You **must specify** the columns to match (`ON` clause). | It **automatically** matches columns with the **same name and type**. |
| Flexibility               | Very flexible — you can join on **any condition** (even different column names). | Less flexible — it **only** joins on same-name columns. |
| Syntax                    | Needs an explicit `ON` condition.                 | No `ON` condition needed.           |
| Risk                      | Less risk — you control which columns to join.    | Risky if tables have unexpected matching columns. |
| Column Handling           | Joined columns are kept as separate fields unless manually selected. | Matching columns are shown **only once** in the result. |
| Example Syntax            | `SELECT * FROM A JOIN B ON A.id = B.ref_id;`       | `SELECT * FROM A NATURAL JOIN B;`   |

---

### **Example to Show the Difference**

Suppose two tables:

```sql
-- Table: Employees
+------------+---------+
| emp_id     | name    |
+------------+---------+
| 1          | Alice   |
| 2          | Bob     |
+------------+---------+

-- Table: Salaries
+------------+----------+
| employee_id| salary   |
+------------+----------+
| 1          | 50000    |
| 2          | 60000    |
+------------+----------+
```

Notice:
- `Employees` table has `emp_id`
- `Salaries` table has `employee_id`
- **Column names are different**!

---

#### Using a Regular `JOIN`
You must **specify** the matching condition:

```sql
SELECT *
FROM Employees
JOIN Salaries
ON Employees.emp_id = Salaries.employee_id;
```

✅ **Works perfectly**, even though column names are different.

---

#### Using a `NATURAL JOIN`
If you try:

```sql
SELECT *
FROM Employees
NATURAL JOIN Salaries;
```

❌ **It will fail** (or return weird results) because there is **no matching column name** (`emp_id` ≠ `employee_id`).

---

### **Summary**

- **JOIN**: Always safe, flexible. You have full control over which columns to match.
- **NATURAL JOIN**: Shorter and simpler when tables are well-designed, but risky if you are not careful with column names.

--- 

# 🌟 What is an Outer Join?

An **Outer Join** in SQL is a type of `JOIN` that **returns matched rows** from both tables **plus** the **unmatched rows** from one or both tables.

In contrast, a normal (INNER) join **only** returns rows where there is a match.

---

# ✨ Types of Outer Joins

There are **three** types:

| Type                | Meaning |
|---------------------|---------|
| **LEFT OUTER JOIN** (or just **LEFT JOIN**) | Returns **all rows from the left table** and matching rows from the right table. |
| **RIGHT OUTER JOIN** (or just **RIGHT JOIN**) | Returns **all rows from the right table** and matching rows from the left table. |
| **FULL OUTER JOIN** | Returns **all rows from both tables**, whether they match or not. |

---

# 📚 Example Tables

```sql
-- Table: Customers
+----+-----------+
| id | name      |
+----+-----------+
| 1  | Alice     |
| 2  | Bob       |
| 3  | Charlie   |
+----+-----------+

-- Table: Orders
+---------+------------+
| order_id | customer_id|
+---------+------------+
| 101     | 1          |
| 102     | 2          |
| 103     | 4          |
+---------+------------+
```

---

# 🔵 1. LEFT OUTER JOIN

Query:

```sql
SELECT *
FROM Customers
LEFT JOIN Orders
ON Customers.id = Orders.customer_id;
```

Result:

| id | name    | order_id | customer_id |
|----|---------|----------|-------------|
| 1  | Alice   | 101      | 1           |
| 2  | Bob     | 102      | 2           |
| 3  | Charlie | NULL     | NULL        |

- **All Customers** are listed.
- If a Customer has no order, `NULL` is shown for order columns (like Charlie).

---

# 🟠 2. RIGHT OUTER JOIN

Query:

```sql
SELECT *
FROM Customers
RIGHT JOIN Orders
ON Customers.id = Orders.customer_id;
```

Result:

| id | name  | order_id | customer_id |
|----|-------|----------|-------------|
| 1  | Alice | 101      | 1           |
| 2  | Bob   | 102      | 2           |
| NULL | NULL | 103      | 4           |

- **All Orders** are listed.
- If an Order’s customer is not found in Customers (like customer_id = 4), `NULL` is shown for customer fields.

---

# 🟣 3. FULL OUTER JOIN

Query:

```sql
SELECT *
FROM Customers
FULL OUTER JOIN Orders
ON Customers.id = Orders.customer_id;
```

Result:

| id   | name    | order_id | customer_id |
|------|---------|----------|-------------|
| 1    | Alice   | 101      | 1           |
| 2    | Bob     | 102      | 2           |
| 3    | Charlie | NULL     | NULL        |
| NULL | NULL    | 103      | 4           |

- **All Customers and all Orders** are shown.
- `NULL` fills missing matches on both sides.

---

# 🎯 Quick Visual Summary

| Join Type    | Shows Unmatched Rows From |
|--------------|----------------------------|
| LEFT JOIN    | Left Table Only             |
| RIGHT JOIN   | Right Table Only            |
| FULL JOIN    | Both Tables                 |

---

# ⚡ Important Note
- Some databases (like MySQL) do **not** directly support `FULL OUTER JOIN`. You can simulate it using `UNION` of `LEFT JOIN` and `RIGHT JOIN`.
- Always check for `NULL` values when using Outer Joins in queries!

---
