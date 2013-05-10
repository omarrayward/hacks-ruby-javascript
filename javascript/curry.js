/*
    Curry is a feature that is not implemented in raw JS.
    It is a feature in which with a function and an some arguments you
    can create a new function that is going to be invoked in the future.
    It is very similar to bind.
    Underscore enables this feature and it's called partial.
*/

function toArray(enume) {
    return Array.prototype.slice.call(enume);
}

Function.prototype.curry = function() {
    if (arguments.length<1) {
        return this; //nothing to curry with - return function
    }
    var __method = this;
    var args = toArray(arguments);
    return function() {
        return __method.apply(this, args.concat(toArray(arguments)));
    }
}

var add = function(a,b) {
    return a + b;
}

var addTen = add.curry(10, 23); //create function that returns 10 + argument
console.log(addTen(20, 44)); //30
console.log(addTen.constructor)
