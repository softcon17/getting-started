# Step 4 - Understand Your Code

Back to the local envionment then and to our API. Hopefully your local frontend is already running in the first shell window, but to test the backend we also need to fire up the backend again. Within the second shell window we again need to run out start command, so run that command and get going.

> Top Tip! If you click on the shell and then press the `up` key, on most shell enviornments will cycle through previous commands you have run, so keep pressing up untill you find that `npm run` type command we used to get it running the first time. This is a super useful feature to know about when it comes to running more complex commands multiple times.<br/><br/>

Check everything is in order by hitting the local endpoint locally from your browser with its URL

```
http://localhost:3000/api/v1/machine
```
or if you are assigned to the bookings microservice
```
http://localhost:3000/api/v1/booking
```

We know that we have an object that currently returns this:
```
[{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}]
```

But we want it to return loads of these as per the `api-specification` file:

```
{
    id: "<UUID>",
    name: "<E.G. CNC Machine>",
    location: "<E.G. My House>",
    status: "<E.G. Online/Offline/Disabled>"
}
```
or if you are working on the bookings microservice:
```
{
    machineid: "<UUID>",
    jobid: "<E.G. J12345>"
    day: "2017-01-01",
    timeslot: "12"
}
```

Open up the IDE of your choice (atom, visual studio code, notepad++, etc) and lets look at the code to begin with<br/><br/>

Find the `main.js` file. In here you should see the logic to connect to a database, where we set our local connection string
```
let connectionString = 'postgres://postgres:postgres@localhost:5432/uksoftcon17';
```
And we have logic that says if we are connected to predix, use that database, if not, use our local
```
if (process.env.VCAP_SERVICES) {
  try {
    connectionString = JSON.parse(process.env.VCAP_SERVICES)['postgres-2.0'][0].credentials.uri;
  } catch(err) {
    console.log(err);
  }
}
const databaseConnection = new PGConnection(connectionString);
```
After that we set up express (which is our app server) to look in the routes folder for our endpoints, and use our database connection. If you are working on a bookings microservice you will see

```
const machineRoutes = require('./routes/machine.js');
machineRoutes(app, databaseConnection);
```

And in the bookings microservice
```
const bookingRoutes = require('./routes/booking.js');
bookingRoutes(app, databaseConnection);
```

The last portion of the code on the `main.js` starts up our server, and you will see it outputs a message that we see in the console when we run our launch command.<br/><br/>

Moving into the `booking.js`  (or `machine.js`) file, there is are a few things going on. Given that we need to modify the `api/v1/machine` or the `api/v1/booking` endpoint, locate the relevant section within the code.

> Hint - We are looking for the `GET` api

If we are to work out what bits of data we need to put into our response object, we firstly need to know what is coming back from the SQL query.<br/><br/>

You will see that we are doing the query with the code :
```
  db.selectQuery("SELECT * FROM .........) {
```
and when looking at the results, we return an error, or enter a new object that handles the success if not.
```
  if (err) {
        // Report back if there were issues running the select
        // Why not look at res.status, and return user santitised messages depending on the error code
        res.status(500).json(err);
      } else {
          .. success code ...
      }

```
We can output variables and print messages using the log syntax 
```
console.log ()
```
And to help you on your way, we have already added a log that will output the result of each sql row as the code loops through them, so try to find
```
//console.log(sqlRow);
```
And in order to get the line to work, we need to uncomment it (which is what the // is doing) to make it look like
```
console.log(sqlRow);
```
If you save your changes, and run the application, after accessing the endpoint via the same URL we tested to begin with, you should now see loads of messages in the shell window, that look something like this:

> In order to see changes dont forget to stop and restart the backend microserice. So again use that `CTRL + C` to stop the app, and then use the `up` key to locate and run the start command again

```
anonymous {
  id: '1aea295a-09ff-4d50-bce9-21eb931c0251',
  name: '',
  status: 'Offline',
  location: '' }
```
Or if you are working on the bookings microservice

```
anonymous {
  machine_id: '947ecd65-5997-4919-b5e0-daeb6f969496',
  job_id: 'j12346',
  date: 2017-10-02T23:00:00.000Z,
  timeslot: '2' }
```

Why not try adding a new console log of your own that say 'Hello World!' to prove that it works<br/><br/>

There are many other things you can do to help debug and understand you code, but for our purposes, you now know enough to be able to start making code changes!

## Completing

Lets get started with building our return object then. If you think about what the endpoint currently returns
```
[{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}]
```
The object holds many clues as to what we need to do first. It shows that for each row we are already building an object
```
{}
```
but it just doesn't contain anything. So lets try and find that in the code. Maybe this is where we need to make a change?
```
 var objectToPush = {
               // You need to put code here
               // EG id : sqlRow.id,
             };
```
Let's see what happens if we activate the 'id' line, re-run the app, and access the localhost endpoint from the browser. Hopefully something like this:
```
[{"machine_id":"947ecd65-5997-4919-b5e0-daeb6f969496"},{"machine_id":"947ecd65-5997-4919-b5e0-daeb6f969496"},{"machine_id":"947ecd65-5997-4919-b5e0-daeb6f969496"},{"machine_id":"947ecd65-5997-4919-b5e0-daeb6f969496"},{"machine_id":"b27a9c93-6c2a-48d3-9693-ece0b93818a6"},{"machine_id":"b27a9c93-6c2a-48d3-9693-ece0b93818a6"}]
```
So one object down, now we just need to add the rest. Use the information that is provided from the enabling the `console.log` to try and add in the rest of the objects that are required to be returned to meet your endpoint specification<br/><br/>

Once completed we can test locally. Add the localhost URL you have been testing into the GET MACHINE (or GET BOOKINGS) url within the cog menu in the UI app that you have running locally, and if all goes to plan you should see the list of machines (or bookings) fill up with lots of lovely data!<br/><br/>

> If you closed the browser tab that contained your local user interface, you can navigate to `http://localhost:8080/` to see it again

Lets now get our tested and saved backend changes into predix! Go to your shell window which you have been using to print out all thoes log messages, and stop the appliction using the hopefully now familiure `CTRL + C` command. Then we can push just like we did the first time, using the command
```
cf push
```
Once uploaded, we can hop back into the cloud to test it thier also. Head back to `https://conference-booking-ui-app.run.aws-usw02-pr.ice.predix.io` in your browser and test it out by adding our predix URL we tested in step 3 into the GET MACHINE (or BOOKINGS) url bar option in the cog menu.
> Dont forget to add the https:// and the api/v1/<SOMETHING>
<br/><br/>
 If all goes to plan, you should see data, this time coming from our predix based microservice and database rather than the local one. Fab!!! 
