/* The classic hanoi towers challenge.
   Given three posts and a stack of discs with holes and different diameters.
   Change the stack from one post to another without stacking a disc with a bigger
   diameter on top of a disc with a smaller diameter.

   This problem is solved recursively
*/

var hanoiTowers = function(n, src, aux, dest){
  if (n > 0){
    hanoiTowers(n-1, src, dest, aux)
    console.log('Move disc '+ n + ' from ' + src + ' to ' + dest)
    hanoiTowers(n-1, aux, src, dest)
  }
}

hanoiTowers(4, 'First post', 'Auxiliary post', 'Destination Post')
