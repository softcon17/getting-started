# Step 4 - Push it!

## Preparing for our first push to Predix

We have our local environment ready to go, but before we get any of the apps up and running, we want to ensure that when we are ready, we have the ability to push into the cloud. <br/><br/>

While the way that each cloud provider (eg AWS, AZURE, PREDIX) may differ in the way they want you to push to cloud, they will almost always do so via a CLI (command line interface). Predix uses the cloud foundry CLI, so lets get that installed by following the documentation at http://docs.cloudfoundry.org/cf-cli/install-go-cli.html#windows <br/><br/>

If you have not already provided the email address for your Predix account to one of the lab support team members, now would be the time to do so, as to test your Predix access, you need it granted to our lab space firstly!

Once the lab support team give you the nod, verify you are able to login to Predix by then running the following from a shell terminal:

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


Make sure you are back in the application folder of your teams groups microservice.<br/><br/>

We tell Predix what we want it to do with our application via the 'manifest.yml' file.<br/><br/>

So firstly change the application name from 'yourname-xxxx' to something more useful, and that should be it!<br/><br/>

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

So check our microservice is bringing back results, let's perform the same test as we did locally, and use our browser to see what data it returns.<br/><br/>

Copy out the URL of your newly pushed app (so yourname-bootcamp-booking-app.run.aws-usw02-pr.ice.predix.io) in my case, and put this into your browser URL bar.

>Don't forget to add https:// to the front of the address!

Hopefully you will see the same data as you did from your local test, but this time it is coming from our lab sessions group shared database! <br/><br/>

Awesome right, we've just pushed out first app to Predix!<br/><br/>

![Time To Celebrate](https://giphy.com/gifs/celebrate-DKnMqdm9i980E)