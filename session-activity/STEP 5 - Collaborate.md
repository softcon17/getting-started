# Step 5 - Collaborate


## Pause - Microservice Architecture


The next thing on our to-do list is to now connect our user interface to all the microservices. But before we do this, lets firstly pause to refresh our minds on why microservices are important / how we can use them to our advantage.<br/><br/>

There is an interesting article comparing microservice to more traditional architectures [here](https://www.nginx.com/blog/introduction-to-microservices/) for further reference reading.<br/><br/>

Think about what we have now. One interface, and one microservice. <br/><br/>

Our microservice relates to booking time to machine or creating / managing machines, but what if we wanted to add a module to inspect the quality of the goods the machines were producing? Maybe we could add another microservice?<br/><br/>

The great thing about microservices is that because they are all written to use HTTP REST, as long as we agree the format the data should be input and output in, we can have multiple teams working on multiple services, written in different languages.<br/><br/>

As long as the user interface application knows how to interact with these, the possibilities are vast. And that is what we move into as our last step of setting up the complete application.

## Connecting the apps together

So we have your one microservice, but we already know that we need a few to get this front end application up and running. So lets put that microservice architecture into practice and connect a single user interface to these multiple microservices.<br/><br/>

To save you some time, we have already pushed the user interface for you, so you can now navigate straight too:
```
https://conference-booking-ui-app.run.aws-usw02-pr.ice.predix.io
```

If you click on the cog icon with the user interface application, you can see we have written in the ability to set your own location for each microservice endpoint.<br/><br/>

Pop in the GET URL you have been working on into either the bookings or machine status section by inputting the url (not forgetting the https), and pressing update. If all goes well, you will see data filling the corresponding section of the application ui.<br/><br/>

This is to illustrate what was mentioned above, that as long as you keep the specification the same, you can connect up to as many miroservices as you want.<br/><br/>

><b>See an error?</b><br/>
>Browsers try really hard to prevent you from doing unsafe things, and it is most likely due to this
> thing called C.O.R.S [more info] (https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS) which essentially means that
> if the resource is coming from anywhere other than itself, it will block it. This is one of the many
> little things that it is handy to know about when doing local dev. Assuming you are using chrome,
> the quickest way to disable this checking when developing is to install the 'Allow-Control-Allow-Origin' chrome extension, then toggle it on. Don't forget to toggle it off when
> you have finished your local testing :)

## Collaborate

Lets prove that we can all work on different microservice, and re-use them to aid our own application! <br/><br/>
Go around the room and find a different endpoint URL for each of the boxes on the cog page from your fellow attendees. Once you have got your boxes filled, and the application is running in its full glory, make sure to show one of the event helpers to claim your free sticker!
