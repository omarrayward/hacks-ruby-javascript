/*  Having an unsigned number. How many 1 are in the bit representation of the number
    We are dealing with 32 bits numbers.

    The method has to run in constant time.
    The idea here is that since we are going to be computing this function a lot of times,
    it is better to precompute all the values // Memoization

    A 32 bit integers has 4,294,967,296. So the storage of all that precomputing could take a
    long time.

    Instead we precompute all the 16 bit integers (65536) numbers and then if the the number
    given is bigger that 65536 we have to do some binary math.

    precompute[n%65536] + precompute[Math.floor(n/65536)]

*/
var _ = require('underscore')
var precompute = {}
var nums = _.range(0,65536)

var count_ones = function(e){
  counter = 0;
  while (e>0){
    if (e%2 === 1) {counter ++}
    e = e >> 1
  }
  return counter;
}

_.each(nums, function(e){return precompute[e]= count_ones(e)})


var count = function (n){
  return precompute[n%65536] + precompute[Math.floor(n/65536)]
}

var date = new Date

var time1 = date.getTime()
console.log(count(31))
var time2 = date.getTime()
console.log("Time in calculating 4294967295: "+ (time2 - time1))
console.log(count(4294967295))
var time3 = date.getTime()
console.log("Time in calculating 4294967295: "+ (time3 - time2))
