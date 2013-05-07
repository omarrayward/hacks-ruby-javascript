// Define the functions map, inject
// Define the methods map and inject in the Array class


function map(collection, callback){
  var new_array = [];
  for (var i in collection)
    new_array.push(callback(collection[i]))
  return new_array
}

// Array.prototype.map = function(cb){
//   var new_array = [];
//   for (var i in this)
//     new_array.push(cb(this[i]))
//   return new_array
// }

function inject(memo, collection, callback){
  for (var i in collection)
    memo = callback(memo, collection[i])
  return memo
}

// Array.prototype.inject = function(memo, cb){
//   for (var i in this)
//     memo = cb(memo, this[i])
//   return memo
// }


function add(m, n){
  return m+n
}


function double(n){
  return 2*n
}



console.log(map([1,2,3], function(n){return 2*n}))
console.log(map([1,2,3], double))
console.log([1,2,3].map( function(n){return 2*n}))

console.log(inject(0, [1,3,4], function(n, m){return n+m}))
console.log(inject(0, [1,3,4], add))
// console.log([1,3,40].inject(0, function(n, m){return n+m}))
