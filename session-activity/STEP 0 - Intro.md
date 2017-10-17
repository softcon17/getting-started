# Predix Starter Bootcamp

# A quick recap....
You have hopefully been assigned one of 3 different microservices to work on over the course of the lab. <br/><br/>

We will start by downloading and running the frontend user interface application, and then move into building the functionality for your microservice.

> Make sure you remember to follow the right set of instructions that correspond with your group when you reach <b>step 2</b>!

After that we get pushing and connecting, sending our microservice into Predix, and connecting the user interface to yours and other peoples microservices.<br/><br/>

Finally we write some code to enhance our microservices, test it, and deploy it.

# Our Sample Application

The application we are building and connecting today focuses around a fairly typical scenario - the need to book time to resources. In our case, its booking time to shop floor machines, and associated functionality to create and manage those machines from our application.

# What Am I Looking At?
Within the Github repository you will see a few different things that you can use to assist your during the bootcamp

## [getting-started](https://github.com/softcon17/getting-started)
This repo contains some code snippets and cheat sheets to help you get started with Predix, REST, Javascript and SQL, so make sure to also check out the `guides` folder for these

## [example-user-interface](https://github.com/softcon17/example-user-interface)

This is how users would interact with our microservice environment. It knows how to connect to each microservice, and presents these to the user as a single, unified experience. We will put this into practice during the session. <br/><br/>

As for the microservice itself, it is written in [polymer](https://www.polymer-project.org/about), which is a Javascript [webcomponents framework](https://www.webcomponents.org/introduction), and compiled using `gulp`. There are many front end Javascript frameworks available, and you may have come across some of the more popular ones such as `angular`, `react`, and `vue`.


## [create-machine-microservice](https://github.com/softcon17/create-machine-microservice)
## [update-machine-microservice](https://github.com/softcon17/update-machine-microservice)
## [booking-microservice](https://github.com/softcon17/booking-microservice)
These are examples of a 'microservice', where there may be many of these which are unified around the HTTP REST protocols, which together provide functionality that is typically presented to the user via another user interface app which knows how to talk to each of the microservices. If you want to know more about microservice architecture, check out [http://www.bmc.com/blogs/microservices-architecture-introduction-microservices/](http://www.bmc.com/blogs/microservices-architecture-introduction-microservices/)<br/><br/>

You can write microservices in a whole variety of languages, and even write each one of your microservices in a different language, showing the flexibility, and potential pitfalls of a microservice architecture. This one is written in Javascript, using [nodeJS](https://nodejs.org/en/about/) as the server engine.<br/><br/>

During the lab you will be pulling, updating and then pushing one of the three to predix.<br/><br/>

## [prebuilt-environment](https://github.com/softcon17/prebuilt-environment)

[This is a zip file](https://github.com/softcon17/prebuilt-environment/archive/master.zip) which contains the getting started repo, example interface and microservice applications, already built with their dependencies installed. <br/><br/>

Now if you are thinking that committing dependencies to git is a bad idea, you would be right. But as you proceed through the lab, if things seem to be taking forever to install, or you are missing dependencies due to your local laptop setup, this is a handy fallback so you can get up and running in time to get stuck into the good stuff!
