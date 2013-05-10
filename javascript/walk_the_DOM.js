/*  Create a function that calls a function
    in every node in the DOM
*/

var walkTheDOM = function(node, func){
  func(node)
  node = node.firstChild;
  while (node){
    func(node);
    node = node.nextSibling;
  }
}

// walkTheDOM(document.body, whateverfunction)
