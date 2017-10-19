# Step 3 - Push it!

## Preparing for our first push to Predix

We have our local environment ready to go, but before we get any of the apps up and running, we want to ensure that when we are ready, we have the ability to push into the cloud. <br/><br/>

While the way that each cloud provider (eg AWS, AZURE, PREDIX) may differ in the way they want you to push to cloud, they will almost always do so via a CLI (command line interface). Predix uses the cloud foundry CLI, so lets get that installed by following the documentation at http://docs.cloudfoundry.org/cf-cli/install-go-cli.html#windows <br/><br/>

If you have not already provided the email address for your Predix account to one of the lab support team members, now would be the time to do so, as to test your Predix access, you need it granted to our lab space firstly!

Once the lab support team give you the nod, lets try to push the backend microservice as-is. Firstly we need to stop it from running locally, the filesytem doesnt get upset by trying to push locked files. So from within our second shell that had the `Application Started on Port 3000` message in it, press `CTRL + C` to stop the run command.<br/><br/>

Next verify you are able to login to Predix by then running the following from the shell terminal:

```
cf login -a https://api.system.aws-usw02-pr.ice.predix.io -u <YOUR USERNAME>
```

If you get asked to select the org, chose the numbered option relating too <b>predixbuilder4</b><br/><br/>

If you want to see what already exists in the space, you can run the command

```
cf apps
```

And you should see a few of our sample apps that we will be using during the lab!


## Push to Predix

We've got it running locally, are happy that it is all working as expected, so want to get our microservice into Predix. Fair enough right?<br/><br/>

So we need to:

![Predix Push](https://memecrunch.com/meme/7CGL7/push-it-real-good/image.gif?w=400&c=1)
<br/><br/>

We tell Predix what we want it to do with our application via the `manifest.yml` file.<br/><br/>

So firstly change the application name from 'yourname-xxxx' to something more useful, and that should be it!

> If you have not already opened the micoservice folder with an IDE of your choosing, now would be a good time to do so, as trying to read code in notepad is not the easiest. Visual Studio Code, Atom or even Code Writer (For windows 10 users only) will all make your life simpler

The rest of file defines the memory the app should use, and most importantly, the Predix database instance the app should connect too. You can define plenty of other things in the manifest too, so check out [the cf docs](https://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html) for more info.<br/><br/>

Because we use the manifest file, it makes it super easy to then push our application to Predix. Just run:
```
cf push
```

If you want to know what else the cf cli can do, [check out the docs](https://docs.cloudfoundry.org/cf-cli/cf-help.html)<br/><br/>

And after a few mins, you should see the following appear in your terminal:
```
1 of 1 instances running                                                                                                       
App started                                                                                                                                    
OK                                                                                                                                           
App YOURNAME-bootcamp-booking-app was started using this command `node main.js`                                                                                                   
Showing health and status for app YOURNAME-<APP-NAME> in org predixbuilder4 / space uk-softcon-17 as <YOUR LOGIN ACCOUNT>...         
OK                                                                                                                                                                  
requested state: started                                                                                                                       
instances: 1/1                                                                                                                                 
usage: 512M x 1 instances                                                                                                                      
urls: yourname-bootcamp-booking-app.run.aws-usw02-pr.ice.predix.io                                                                             
last uploaded: Mon Oct 9 10:40:29 UTC 2017                                                                                                     
stack: cflinuxfs2                                                                                                                              
buildpack: https://github.com/cloudfoundry/nodejs-buildpack                                                                                                                                                                                                            
     state     since                    cpu    memory          disk          details                                                           
#0   running   2017-10-09 11:41:15 AM   0.0%   33.9M of 512M   61.8M of 1G                                                                     
```

So check our microservice is bringing back results, let's perform the same test as we did locally but against our lovely new app running in predix, and use our browser to see what data it returns.<br/><br/>

Copy out the URL of your newly pushed app (so yourname-bootcamp-booking-app.run.aws-usw02-pr.ice.predix.io) in my case, and put this into your browser URL bar.

>Don't forget to add https:// to the front of the address!

```
https://yourname-bootcamp-booking-app.run.aws-usw02-pr.ice.predix.io/api/v1/<WHATEVER-I-PUT-IN-LOCALLY>
```

Hopefully you will see the same data as you did from your local test, but this time it is coming from our lab sessions group shared database! <br/><br/>

Awesome right, we've just pushed out first app to Predix!<br/><br/>

![Time To Celebrate](https://giphy.com/gifs/celebrate-DKnMqdm9i980E.gif)

## Seeing the Front End in Action

So great news we know the URL works, but we cant really add this too the app yet as we are not returning any data. However do not fear! We have added a URL for you to test!<br/><br/>

We have put a copy of the working frontend into Predix already to speed things up for you, so navigate to `https://conference-booking-ui-app.run.aws-usw02-pr.ice.predix.io` and press on any of the cog icons to bring up the list of URLS the application needs. Enter the same url as you did above, into one of following (not forgetting to press update):
```
Group 1 -> POST NEW MACHINE
Group 2 -> PUT MACHINE STATUS
Group 3 -> POST BOOKING

```
> If you are Group 2 or 3, you will also need to add `https://sample-update-machine-microservice.run.aws-usw02-pr.ice.predix.io` to the GET MACHINES input box so you can select a machine to test with


You can enter the same URL and (hopefully!) get different results not due to any sort of magic, but because the `METHOD` is different (Look at the REST cheatsheet if you need more info on this), so although they look the same, the one you tested earlier is using the `GET` method, and the one you just entered is using either a `POST` or a `PUT` method depending on the challange <br/><br/>

Finally go the section of the UI that relates to your group and try this new endpoint.<br/><br/>

If you are in <b>group 1:</b>
```
Fill in the name and location fields with your own name, and press create machine. 
```
For thoes in <b>group 2:</b>
```
Try to change one of the exising machine status 
```
And thoes in <b> group 3:</b>
```
Try to create a new booking
```
Now bask in your success again! Come up to the stage and refresh this list of machines on our working demo, and hopefully you will be able to see the change you made also reflected!<br/><br/>

><b>See an error?</b><br/>
>Browsers try really hard to prevent you from doing unsafe things, and it is most likely due to this
> thing called C.O.R.S [more info] (https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS) which essentially means that
> if the resource is coming from anywhere other than itself, it will block it. This is one of the many
> little things that it is handy to know about when doing local dev. Assuming you are using chrome,
> the quickest way to disable this checking when developing is to install the 'Allow-Control-Allow-Origin' chrome extension, then toggle it on. Don't forget to toggle it off when
> you have finished your local testing :)

So there have it, weve not done a real transaction in our microservice. Its about time we got that GET endpoint working then... so on to the next step.