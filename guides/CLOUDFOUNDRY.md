# Cloud Foundry useful commands

See also https://docs.cloudfoundry.org/cf-cli/cf-help.html

## Deploy an application

```
cf push
```
* Pushes the contents of the current directory.  It will try to use a URL named using the application name from `manifest.yml` - beware clashes!
See [here](#contents-of-manifestyml) for more information about what goes in this file.
* Once the app is pushed, Cloud Foundry will try to start it, and by default wait until it detects that the app is listening for incoming connections on a port defined as the `PORT` environment variable.

```
cf push --random-route
```
* Pushes the contents of the current directory, and creates a new random URL by which the application can be accessed.

## List applications

```
cf apps
cf a
```
* These commands are equivalent.
* Lists the applications in the current space, together with status information.

## Getting detailed information about an app

```
cf app <app-name>
```
* Returns detailed information about the app called `<app-name>`.

## Delete an application
```
cf delete <app-name>
cf d <app-name>
```
* These commands are equivalent.
* Deletes the app called `<app-name>`
* Will not work if there are any service instances currently bound to the app.

## List applications

```
cf apps
cf a
```
* These commands are equivalent.
* Lists the applications in the current space, together with status information.

## Restart an application
```
cf restart <app-name>
cf rs <app-name>
```
* These commands are equivalent.
* Stops and then restarts all instances of a app.  This won't make any changes to the configuration of the app.

```
cf restage <app-name>
cf rg <app-name>
```
* These commands are equivalent.
* Stops and then reloads all instances of an app from the latest environment, executables, etc.  This will cause any configuration changes to take effect.
* Always need to call this after _e.g._ `cf set-env`

## List services

```
cf marketplace
cf m
```
* These commands are equivalent
* Lists the services available in the current space

## Getting detailed information about an app

```
cf app <app-name>
```
* Returns detailed information about the app called `<app-name>`.

## Managing service instances

```
cf create-service <service> <plan> <service-instance> [ -c '{"config":"value"}' ]
cf cs <service> <plan> <service-instance> [ -c '{"config":"value"}' ]
```
* These commands are equivalent.
* Creates (provisions) a new instance of a service of type `<service>`, with the charging plan `<plan>`, and names it `<service-instance>`.
* Some services require configuration information passed as JSON.  For example, the URL of an authentication service may be required.

```
cf delete-service <service-instance>
cf ds <service-instance>
```
* These commands are equivalent.
* Deletes (deprovisions) the service instance `<service-instance>`.
* Will not work if the service is currently bound to an application.

## Using service instances in an app

```
cf bind-service <app-name> <service-instance>
cf bs <app-name> <service-instance>
```
* These commands are equivalent.
* Binds the service instance named `<service-instance>` to the app named `<app-name>`.
* Information about how to connect to the service now appears in the `VCAP_SERVICES` part of the environment.
* You must run `cf restage <app-name` for the change to take effect in the app.

```
cf unbind-service <app-name> <service-instance>
cf us <app-name> <service-instance>
```
* These commands are equivalent.
* Unbinds the service instance named `<service-instance>` from the app named `<app-name>`.
* You must run `cf restage <app-name>` for the change to take effect in the app.

## Getting information about service instances

```
cf service <service-instance>
```
* Displays information about the service instance called `<service-instance>`.

```
cf services
cf s
```
* These commands are equivalent.
* Displays information about all service instances in the current space.

## Configuring services via the environment

```
cf set-env <app-name> <env-variable> <env-value>
cf se <app-name> <env-variable> <env-value>
```
* These commands are equivalent.
* Sets the environment variable `<env-variable>` to have value `<env-value>` for the app `<app-name>`.
* You must run `cf restage <app-name>` for this change to take effect.

```
cf unset-env <app-name> <env-variable> <env-value>
cf ue <app-name> <env-variable>
```
* These commands are equivalent.
* Unset the environment variable `<env-variable>` for the app `<app-name>`.
* You must run `cf restage <app-name>` for this change to take effect.

```
cf env <app-name>
cf e <app-name>
```
* These commands are equivalent.
* Prints the environment for the app `<app-name>`

```
cf create-user-provider-service <service-name> -p '{"key1":"value1", "key2", "value2"}'
cf cups <service-name> -p '{"key1":"value1", "key2", "value2"}'
```
* These commands are equivalent.
* Creates a service called `<service-name>`.
* You can bind this service to your apps, just like other services, using `cf bind`.
* The contents of the JSON supplied as the `-p` argument then appear in the `VCAP_SERVICES` part of the environment.

```
cf update-user-provider-service <service-name> -p '{"key1":"value1", "key2", "value2"}'
cf uups <service-name> -p '{"key1":"value1", "key2", "value2"}'
```
* These commands are equivalent.
* Updates a service called `<service-name>`.
* It must exist.
* Following a change, you must run `cf restage` on any bound apps in order to see the changes.

```
cf delete-user-provided-service <service-name>
cf dups <service-name>
```
* These commands are equivalent.
* Deletes a service called `<service-name>`.
* Will fail if the service is currently bound to any apps

# Contents of manifest.yml

`manifest.yml` is a file which is placed in the root directory of the application, and contains information about what to deploy and how to deploy it.

See https://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html for lots of detail.

The file is in YAML (_YAML Ain't Markup Language_) format.  The file for the sample application looks like this:
```yaml
applications:
  - name: new-machine-microservice
    memory: 512M
    buildpack: https://github.com/cloudfoundry/nodejs-buildpack
    instances: 1
    command: node main.js
```
These elements have the following meanings.

|Element|Mandatory?|Meaning|
|-------|----------|-------|
|name|Yes|The default name for the application when pushed|
|memory|No|How much memory each instance should use|
|buildpack|No|This defines the environment in which the application will run, and includes things such as which software is available, and actions to take when starting the app|
|instances|No|The default number of instances to run|
|command|No|The command to run to start the applciation|

In practice, while only the name attribute is technically mandatory, you should always provide at least a buildpack and command too.  See the documentation for a full list of what's available.

There are other things that you can provide here too.  Importantly, you can list services to which your app should bind, and values to place in the environment.  For example:

```yaml
applications:
  - name: my-app
    buildpack: https://github.com/cloudfoundry/nodejs-buildpack
    command: node main.js

services:
  - application-database
  - security-database

env:
  MAX_UPLOAD_SIZE: 50M
```

This would bind the app to the service instances named `application-database` and `security-database`, and set an environment variable called `MAX_UPLOAD_SIZE` to have value `50M`.  Note that the format of the YAML for each section is subtly different.
