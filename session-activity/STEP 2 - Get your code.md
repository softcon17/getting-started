# Step 2 - Get your Code

Now that we have a front end running, we need to create our very own microservice to hook up to it. <b>You will see that each group has been given a different one to work on</b>, and we will talk about that more in step 5, so for now you will have to trust us when we say there is a plan!<br/><br/>

The microservice we are creating will handle one of three things:

### Group 1 - Create and list Machines
This microservice will enable the front end to create new machines, as well as get all currently configured machines and their status.<br/><br/>

You will need to download from the <b>create-machine-microservice</b> repo

### Group 2 - Update and list Machine Status
Group 2's microservice will allow the status of a machine to be updated, as well as get all currently configured machines and their status.<br/><br/>

You will need to download from the <b>update-machine-microservice</b> repo

### Group 3 - Make and Get Bookings
The microservice handles all things booking. So getting the current bookings, and enabling the addition of new bookings..<br/><br/>

You will need to download from the <b>booking-microservice</b> repo


## Download and Install the Microservice

Firstly we need to get the code for the microservice we are going to be responsible for updating and pushing, so clone the repo for your group number repo and navigate to it using shell.<br/><br/>

Just like the front end application, we need install all the dependencies that make up our app. So if you look in the root of the folder you can see that we again have a package.json file, so lets go and use the same technique as last time to install them all, running:

```
npm install
```

If you have issues, or this seems to be taking too long, you can also download and open the pre-built version from the <b>prebuilt-environment</b> repository.<br/><br/>

The quick and dirty way to launch the application, skipping tests or startup scripts is to use the node command, so assuming you are in the microservice folder app within your shell window you can run:
```
node ./main.js
```
And you should see a message saying that your application is up and running on port 3000.<br/><br/>

Lets check it is all working as expected by trying to access one of our URL endpoints from the browser:

```
http://localhost:3000/api/v1/machine
```
or if you are assigned to the bookings microservice
```
http://localhost:3000/api/v1/booking
```
What you will see displayed is the JSON [(more about JSON REST)](https://www.infoworld.com/article/3204125/apis/the-rules-for-rest-how-to-be-restful-in-httpjson-apis.html) object that returned containing a list of all out machines:

```
[{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}]
```

But UH-OH, where's the data!?! Maybe we need to update this endpoint in a second to add some data!?!<br/><br/>

Before we do that, we have mentioned the quick and dirty way to start the application, but what about the proper way?<br/><br/>

Say we want to parameterise the launch of the application to pass in additional configuration, or automatically run tests on startup. We would want these commands to be taken care of for us without having to type them in every time right!?!<br/><br/>

This is where the package.json file saves the day again! Take a look at the scripts section, and you will see:
```
"SET NODE_ENV=dev && node main.js"
```
Where we are doing exactly what was just mentioned. You can add as many scripts as you like, depending on what you are trying to achieve. To launch the app using the scripts (assuming you have cancelled the already running instance of the app), you swap from instructing node to start the app, to npm, so:
```
npm start
```
If you want to take your testing to the next level, applications such as 'postman' can be used to test your API's [advice can be found here](http://blog.getpostman.com/2017/07/28/api-testing-tips-from-a-postman-professional/), but or today we will be focusing on testing GET requests, and only in the browser.<br/><br/>

> This sample app doesn't 'hot reload', so if you make changes to the code, and wonder why nothing is changing when you hit the endpoint, you may need to cancel the running instance of the microservice and run it again
