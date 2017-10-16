# SQL

SQL is case insensitive but it is conventional to make all tables names and column names lower-case and all keywords UPPER CASE.

## Create a table

```sql
CREATE TABLE users (name STRING NOT NULL, id INTEGER UNIQUE NOT NULL);
```

Creates a table called users with 2 columns, name which is a string and id which is an integer.

## Insert values into a table

```sql
INSERT INTO users (name, id) VALUES ('Bob', 32);
```

## Querying

Queries are where SQL gets its power.
You only need to tell the database what information you need, not how to get it.
The database will use different methods for querying the database depending on the size of the tables and what indices are available, all transparently to the user.

For example:

```sql
SELECT users.name FROM users WHERE users.id = 5; -- Gets all users with id 5
SELECT users.id FROM users WHERE users.name = 'Bob'; -- Gets all ids for users with the name 'Bob'
SELECT users.name, users.id FROM users WHERE users.name LIKE 'B%'; -- Gets all names and ids for users with names beginning with B
SELECT users.id FROM users WHERE users.name LIKE 'B%' LIMIT 4; -- Gets 4 ids for users with names beginning with B
SELECT users.id FROM users WHERE users.name LIKE 'B%' ORDER BY id LIMIT 1; -- Gets the smallest ID for a user with name beginning with B
```

## Removing values from a table

To delete the user with id 32, do the following:

```sql
DELETE FROM users WHERE users.id = 32;
```

Note that you can use the full power of the query syntax in the `WHERE` clause.

## Updating a value in a table

To change the name of the user with id 32 to 'Robert', do the following:

```sql
UPDATE users SET name = 'Robert' WHERE id = 32;
```

Note that you can use the full power of the query syntax in the `WHERE` clause.

## SQL injection attacks

You should not create the query dynamically in your chosen programming language based on user input (for example in javascript)

```js
let query = `SELECT users.name FROM users WHERE users.id = ${userid} AND name = 'Dylan'`;
```

This is because if a user would input the userid: `0; DELETE FROM users WHERE users.name = 'Bob'; --`, this would result in the query being

```sql
SELECT users.name FROM users WHERE users.id = 0; DELETE FROM users WHERE users.name = 'Bob'; -- AND name = 'Dylan';
```

Which would delete all users with the name 'Bob'.
This is the most common security vulnerability (by the OWASP top 10), and should be resolved by using the interpolation libraries provided by your programming environment.
For example in our case we would do this:

```js
const query = 'SELECT users.name FROM users WHERE users.id = $1';
db.querySelect(query, [userid], function (err, data) { ... });
```

This prevents SQL injections for that query.
