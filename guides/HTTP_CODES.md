# Common HTTP return codes and return values

See also 
* http://www.restapitutorial.com/httpstatuscodes.html
* https://en.wikipedia.org/wiki/List_of_HTTP_status_codes

### 200 OK
Operation completed successfully.  A body of some kind is expected.

```js
function(req, res) {
...do something
  res.status(200).json(results);
}
```

### 201 CREATED
Operation completed successfully, and a resource was created.  There may or may not be a body.  There should be a `Location` header, pointing to the resource.
```js
function(req, res) {
...create something
  res.header('Location','/url').status(201).json(results);
  // You can also use res.set('Location','/url').status(201).send(results);
}
```

### 204 NO CONTENT
Operation completed successfully.  There must not be a body.  Use this normally for DELETE requests 
```js
function(req, res) {
...create something
  res.status(204).send();
}
```
### 400 BAD REQUEST
There was something wrong with the request (_e.g._ a parameter was missing, or not in the correct format).  There should be a body with an informative error message.
```js
function(req, res) {
...check parameters
  res.status(400).send('Parameter "id" must be a uuid');
}
```

### 404 NOT FOUND
The requested resource couldn't be located.  There should be a body with an informative error message.
```js
function(req, res) {
...fail to locate the resource
  res.status(404).send('The requested resource could not be located');
}
```

### 500 SERVER ERROR
Something went wrong internally in the server.  There should be an error message, but **do not leak details of your implementation.  No tracebacks!**

```js
function(req, res) {
  try {
  ...do something
  } catch (error) {
    res.status(500).send('Server error');
  }
}
```
