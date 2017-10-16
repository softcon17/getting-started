# Step 1 - Install PostgreSQL

Within Predix we will be using a PostgreSQL database. For the purposes of testing we also want to set one up locally.<br/>

PostgreSQL is available for install via mytech (search for PostgreSQL)

# Step 2 - Install a CLI or DB Management GUI

Once your DB is installed you will need a way to access it! Depending on where / how you installed PostgreSQL you may already have this! If not, pgadmin (https://www.pgadmin.org/) has a simple to use interface and will do the job for the purposes of the session.

# Step 3 - Creating the Database

Now you having a database up and running, and an admin UI to view it in, lets go ahead and create a database!

So within pgAdmin4 (or your manager of choice), create a new database called `uksoftcon17`, and within that, execute the SQL from the `create_the_tables.sql` file. You will see that this creates our bookings and machines tables that we will need to hook our api up to later.

# Step 4 - Populating the Database

Inserting some sample data is the last step. Now you can have fun and do your own, or use ours! If you want to use the sample provided, run the sql from the `populate_the_database.sql` inside the newly created database.

# Step 5 - Installing NodeJS (JavaScript Server) and NPM (Package Manager)

Next we move onto the server technology. In this case we are going to be using NodeJS. You can read more about it at https://nodejs.org/en/, and again this can be installed via mytech.

The standard NodeJS deployment also comes with NPN, which is the node package manager (or you can use yarn if you prefer), which we will use to grab the required dependences when we run our app during the lab.

# Step 6 - Verifying NodeJS and NPM

Finally you can check NPM and node install correctly by running:
```
node -v // Should return 8.Something or greater
npm -v // Should return 5.Something or greater
```
