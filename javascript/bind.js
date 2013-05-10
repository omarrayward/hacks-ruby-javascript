/*
  How to create the method bind for the Function object
  using apply.
  Remember that bind, only binds the function to the object
  and then you can invoque the function whenever you want.
*/

Function.prototype.bind2 = function(obj){
  var that = this     // this in this case is the function that will call bind2
  return function(){
    return that.apply(obj, arguments) // obj will be this inside the function that
  }
}
