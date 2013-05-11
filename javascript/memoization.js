var fibonacci = (function(){
  var memo = [0,1]
  var fib = function(n){
    var result = memo[n];
    if (typeof result !== 'number'){
      result = fib(n - 1) + fib(n - 2);
      memo[n]= result;
    }
    return result;
  };
  return fib
})();

console.log(fibonacci(1000))
console.log(fibonacci(1000))


var memoizer = function(memo, formula){
  var recur = function (n){
    var result = memo[n];
    if (typeof result !== 'number'){
      result = formula(recur, n)
      memo[n] = result;
    }
    return result;
  };
  return recur;
};

var fibonacci2 = memoizer([0,1], function(recur, n){
  return recur(n-1) + recur(n-2);
});

console.log(fibonacci2(1000))
console.log(fibonacci2(1000))
