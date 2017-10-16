# Javascript

Javascript is a dynamic, untyped language.
Since we are writing using node version 6 or above, we have access to many of the new features from the latest javascript specification.
Some of these features are used in the example application.

## Declaring variables

Variables in javascript are untyped.
They can be defined in two ways, `let x = 4` and `const x = 4`.
There is one difference between these two declarations.
With `const`, you cannot reassign the variable (and doing so is a syntax error), and with `let` you can.
It is easier to write correct code if you always use `const`.

Note that there is an older way to declare variables in javascript, `var`.
It is advised that you do not use this since it has strange semantics and doesn't act like you expect it to.

Example:

```js
let x = 6;
const y = 19;

console.log(x, y); // prints 6 19

x = 87;
y = 129; // Syntax error
```

## Declaring functions

Functions are declared in javascript using the `function` keyword.
They are first class values and can be stored in variables and passed as parameters to other functions.

Example:

```js
function add(a, b) {
  return a + b;
}

console.log(add(2, 4)); // prints 6

function adder(n) {
  // Functions can be returned and don't need names
  return function (x) {
    // You can refer to variables outside of the function
    return x + n;
  }
}

const addSix = adder(6); // addSix is a function which adds 6 to its argument
console.log(addSix(3)); // prints 9
```

## String interpolation

Single quotes (') and double quotes (") are equivalent to each other.
However, in a single quoted string, you can add double quotes without escaping them (and vice versa).
Try to be consistent within your application as to which one you use.
In javascript, it is possible to append strings together using the `+` operator.
For example:

```js
'A' + ' ' + 'string' + ' you can add numbers too ' + (44 - 2) + ' and other expressions' + responseData;
```

It is also possible to evaluate expressions within a string using the backtick (\`) notation.
Putting `${...}` inside backticks, is equivalent to the addition above.

```js
`A string you can add numbers too ${44 - 2} and other expressions ${responseData}`
```

## Basic syntax

### Equality checking

Javascript has 2 equality operators, `==` and `===`.
It is advised to always use the `===` operator.
Their differences are highlighted below:

```js
'2' == 2; // => true
'2' === 2; // => false
null == undefined; // => true
null === undefined; // => false
```

### If statement:

```js
if (x) {
  ...
} else if (y) {
  ...
} else {
  ...
}
```

### For loops

```js
for (<initialise>; <check>; <increment>) {
}
```

For example

```js
for (let i = 0; i < 20; i++) {
  console.log(i);
}
```

### While loops

```js
while (condition) {
}
```

For example

```js
let i = 0;
while (i < 50) {
  console.log(i);
  i++;
}
```

### Exception handling

```js
try {
  ...
} catch (e) {
  ...
} finally {
  ...
}
```

The code in the try block will execute and if any error is thrown, control will end up in the catch block.
The code in the finally block will always execute.
Beware that exceptions thrown in asynchronous code will not be handled in the catch.

To throw an exception, use `throw new Error('message');`.

## Callbacks and asynchronicity

A lot of core functions in javascript and the libraries that you will use are _asynchronous_.
This means that the function that you call will return immediately, and at some later point, the provided callback will be executed.
The simplest example for this is the `setTimeout` function.
This will return immediately and after a specified number of milliseconds will call the provided function.
For example:

```js
setTimeout(function () { console.log('Hello asynchronous world!'); }, 1000);
```

will print `Hello asynchronous world!` after 1 second.
To show the immediate return of the `setTimeout` function, we have the following example:

```js
setTimeout(function () { console.log('I waited 1000ms'); }, 1000);
setTimeout(function () { console.log('I only waited 10ms'); }, 10);
setTimeout(function () { console.log('I waited 500ms'); }, 500);
```

will print

```
I only waited 10ms
I waited 500ms
I waited 1000ms
```

Callbacks are often used in database queries and other network calls (and some filesystem calls).
They are used because javascript is single threaded and we do not want to block receiving other requests while these queries are going on.
You can see the use of callbacks in routes/machine.js.

The convention is to pass an error object as the first argument to the callback.
You should always handle these sensibly.
Any exceptions thrown in the callback **DO NOT** get caught by a surrounding catch block.
The following example prints `oops` and **DOES NOT** print `handled`.

```js
try {
  setTimeout(function () {
    console.log('oops');
    throw new Error('oops');
  }, 1000);
} catch (e) {
  console.log('handled');
}
```

## Objects in javascript

Objects in javascipt are simply key-value pairs.
Unlike in many other languages, the key for a javascript object must always be a string.
They can be declared using curly braces `{}` and you can initialise them with key-value pairs like so

```js
{
  name: 'Joe Bloggs',
  age: 50,
  favouriteFood: 'Pizza'
}
```

There are two ways of accessing properties once an object is initialised.
Either using `object[propertyName]` or `object.propertyName`.
Examples of both are given below:

```js
const myObject = { name: 'Jane Doe' };
console.log(myObject.name); // => Jane Doe
console.log(myObject['name']); // => Jane Doe

myObject.age = 45; // Can set new properties
myObject['favouriteFood'] = 'chips'; // Can set propeties like this too
myObject[1] = 'one'; // You can experiment with this yourself

myObject.name = 'Joan Doe'; // Properties can be overwritten
```

Notice how I assigned new properties and overwrote old ones even though `myObject` was `const`.
This is because `const` means that I cannot reassign `myObject`, but `myObject` can still be changed.

Objects can contain other objects as values, and also functions.
Another useful property of objects in javascript is that they can be converted to and from the JavaScript Object Notation (JSON).

### JSON

JSON is a standard format for transmitting data.
It is often used within REST APIs (like the one you are implementing) to respond to queries or to make the queries themselves.
It has a much stricter method for defining objects, for example, the object above (with name 'Joe Bloggs') would be written in JSON as
`{"name": "Joe Bloggs", "age": 50, "favouriteFood": "pizza"}`

In order to convert JSON to javascript objects and back you can use the standard functions `JSON.parse` and `JSON.stringify`.

You can see these functions used in the file routes/machine.js.

### Classes and the `new` keyword

These are more advanced concepts in javascript, but if you're interested, you can have a look at
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes

## Resources:

* The mozilla developer site has the best information on the javascript language: https://developer.mozilla.org/en-US/
  I would recommend when searching for javascript questions to put `mdn` in the query to ensure you get the link from here.
* Node.js API: https://nodejs.org/dist/latest-v6.x/docs/api/
* Express documentation: http://expressjs.com/
