# Step 5 - Collaborate

## Pause - Microservice Architecture

The next thing on our to-do list is to prove that from this one public user interface, we can connect to any microservice as long as it follows the required specification. But before we do this, lets firstly pause to refresh our minds on why microservices are important / how we can use them to our advantage.<br/><br/>

There is an interesting article comparing microservice to more traditional architectures [here](https://www.nginx.com/blog/introduction-to-microservices/) for further reference reading.<br/><br/>

Think about what we have now. One interface, and one microservice. <br/><br/>

Our microservice relates to booking time to machine or creating / managing machines, but what if we wanted to add a module to inspect the quality of the goods the machines were producing? Maybe we could add another microservice?<br/><br/>

The great thing about microservices is that because they are all written to use HTTP REST, as long as we agree the format the data should be input and output in, we can have multiple teams working on multiple services, written in different languages.<br/><br/>

As long as the user interface application knows how to interact with these, the possibilities are vast. And that is what we move into as our last step of setting up the complete application.

## Connecting the apps together

So we have your one microservice running locally and in predix, but we already know that we need a few a few more links to complete all the boxes within the UI cog menu. So lets put that microservice architecture into practice and connect a single user interface to these multiple microservices.<br/><br/>

So back to the predix based front-end then in the browser
```
https://conference-booking-ui-app.run.aws-usw02-pr.ice.predix.io
```

>If you have closed your browser window since last time, you will again also need to pop in the GET URL you have been working on into either the bookings or machine status section by inputting the URL (not forgetting the https), and pressing update.

## Collaborate

Lets prove that we can all work on different microservice, and re-use them to aid our own application! <br/><br/>
Go around the room and find a different endpoint URL for each of the boxes on the cog page from your fellow attendees. Once you have got your boxes filled, and the application is running in its full glory, make sure to show one of the event helpers to brag about your excellent code skills!<br/><br/>

>If you are wondering why everybody in the room can put in different URL's into the Predix running front end, but you cannot see anyone elses, then I love your thinking! As this application is written using javascript, which is a client side rendered languague, the changes you are making via the cog menu are only actually happening on the version of the app that has been rendered on your browser, in your machine. So if you were to line up all the laptops in the room, they could all use different endpoints, and be showing completely different data!
