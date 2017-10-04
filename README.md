# getting-started

In preparation for the bootcamp session, here is our recommended list of software you should have installed or available to you, to get you on your way. This will allow you more time to focus on the tasks at hand

## Sofware it will be handy to have

In order to work on a live sample application, it will be beneficial to have the following apps installed:

- PostgresSQL database (And management GUI of your preference) loaded with sample tables and data
- NodeJS (Reccomend Version 8 or above)
- NPM

## How to install above stofware

If you are not familiar with the software listed above, check out some more information here:

### Installing PostgreSQL

The postgreSQL community installer can be found at https://www.enterprisedb.com/downloads/postgres-postgresql-downloads#windows, and also has the option to install pgAdmin4, which is a management GUI

### Install a CLI or DB Management GUI

Once your DB is installed you will need a way to access it! Depending on where / how you installed PostgreSQL you may already have this! If not, pgadmin (https://www.pgadmin.org/) has a simple to use interface and will do the job for the purposes of the session.

### Creating the Database

Once you have a database up and running and an admin UI to view it in, lets go ahead and create a database! So within pgAdmin4 (or your manager of choice), create a new database called uksoftcon17, and within that, execute the SQL from the create_the_tables.sql file in this repo. You will see that this creates our bookings and machines tables that we will need to hook our API up to later.

### Populating the Database

Inserting some sample data is the last step of the database install and setup process. Now you can have fun and do your own, or use ours! If you want to use the sample provided, run the sql from the populate_the_database.sql inside the newly created database.

### Installing NodeJS (JavaScript Server) and NPM (Package Manager)

This is our server technology. In this case we are going to be using NodeJS. You can read more about it at https://nodejs.org/en/. The standard NodeJS deployment also comes with NPN, which is the node package manager (or you can use yarn if you prefer), which we will use to grab the required dependences when we run our app during the lab.

### Verifying NodeJS and NPM

Finally you can check NPM and node install correctly by running:
```
node -v // Should return 8.Something or greater
npm -v // Should return 5.Something or greater
```
