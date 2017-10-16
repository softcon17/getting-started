# Step 1 - Run it!

Depending on how far you got with the pre-work, some of this you may have already tackled. But in addition to telling you what to install, we will also focus now on why we have done some of these things :)

### Installing PostgreSQL

So first things first we need a database. Pretty much every application needs a database to persist data and do something useful too it. In Predix there is a section with a [whole variety of data services] (https://www.predix.io/catalog/services) you may wish to look into, but the one we are interested in is `Database as a service`.<br/><br/>
But what does this have to do with my machine!?!!<br/><br/>
As we want to be able to build and test code locally before pushing to the cloud, we need to set up our local database to mimic the functionality of those Predix services, which is why we need install a local version of PostgreSQL.<br/><br/>

The postgreSQL community installer can be found at: https://www.enterprisedb.com/downloads/postgres-postgresql-downloads#windows, and also has the option to install pgAdmin4, which is a management GUI.<br/><br/>

Once your DB is installed you will need a way to access it! If you are great at psql in the command line then great! But if not, you might want a user interface to help you interact with it.<br><br/>

Depending on where / how you installed PostgreSQL you may already have this! If not, pgadmin (https://www.pgadmin.org/) has a simple to use interface and will do the job for the purposes of the session.

### Filling our local DB with data

Once you have a database up and running and an admin UI to view it in, lets go ahead and create a database! So within pgAdmin4 (or your manager of choice), create a new database called <b>uksoftcon17</b>, and within that, execute the SQL from the `create_the_tables.sql` file in this repo. You will see that this creates our bookings and machines tables that we will need to hook our API up to later.<br/><br/>

Inserting some sample data is the last step of the database install and setup process. Now you can have fun and do your own, or use ours! If you want to use the sample provided, run the sql from the `populate_the_database.sql` inside the newly created database.

### Installing Server Tech

Depending on the languages that were used to write your application in, you then need to install the same technology as will be used in the cloud, so you can mirror how they will run locally.<br/><br/>

In our case remember that we are using NodeJS as the Javascript server for the back end, and Polymer using gulp (which uses nginx) to power our front end. So lets get those technologies installed.<br/><br/>

NodeJS has a [simple exe](https://nodejs.org/en/download/) that can be installed, and handily also installs [npm](https://www.npmjs.com/), which is the dependency manager that Node uses.<br/><br/>

Once installed we need to finally install gulp, which provies the web services that will run the user interface application. As NPM is insanely powerful, we can actually install gulp using it. And by using a -g flag, also make it available across the entire machine. You can install running:

```
npm install gulp -g
```

Finally you can check NPM and node install correctly by running:

```
node -v // Should return 8.Something or greater
npm -v // Should return 5.Something or greater
```

### Run the User Interface Locally

That's enough reading and waiting, let's get our first app up and running!<br/><br/>

First up is the user interface application, so download the project files from the 'example-user-interface' repo, and make sure you have a shell session that is located within the folder <br/><br/>

It was touched on earlier that npm is the package manager that is used by node. Take a look at the `package.json` file to see what dependencies need installing for the microservice.<br/><br/>

We can install everything in this file programmatically using the following command from within the teams microservice folder:

```
npm install
```

You will then see a node_modules folder has appeared, and there are now lots of folders inside it. If you are wondering why there are so many, welcome to JavaScript!!! Each one of the modules that you install by defining in your package.json also has its own package.json, which may in turn install a bunch more dependencies, and this can repeat for many layers.<br/><br/>

When it comes to package managers, there are many! So in our case we actually have a different package manager that controls which re-useable user interface components our app uses. You can see these in the 'bower.json' file time. We can install these using the command:

```
bower install
```

Finally we need to compile and minify the code so it runs super fast when we push it to Predix! We have implemented this using a gulp build chain, so can do this using

```
gulp build
```
See how it has added another folder called 'build' to your project?<br/><br/>

Dependencies installed, now its time to run the thing! Lets try and use the npm script that was mentioned above this time, so within the folder run the command:

```
npm start
```

It takes a few seconds to run, but eventually a browser should pop open and you can see the user interface in all its glory!
