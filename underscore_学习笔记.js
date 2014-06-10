
each 
_.each(list, iterator, [context]) 
----------------------------------
myfunc = function(name) {
	console.log("get: "+ name);
}

_.each([1,2,3,4,5], myfunc);
或者
_.each([1,2,3,4,5], function(name) {
	console.log('get: '+ name);
});

context的用法：
context 就是你在_.each里面能用 this 指向的东东：
"context is where this refers to in your iterator function"
参考overflow: 'http://stackoverflow.com/questions/4946456/underscore-js-eachlist-iterator-context-what-is-context'

var person = {};
person.friends = {
  name1: true,
  name2: false,
  name3: true,
  name4: true
};

_.each(['name4', 'name2'], function(name){
  // this refers to the friends property of the person object
  alert(this[name]);
}, person.friends);








