----------------------------------
each _.each(list, iterator, [context]) Alias: forEach 
----------------------------------
myfunc = function(name) {
	console.log("get: "+ name);
}

_.each([1,2,3,4,5], myfunc);
或者
_.each([1,2,3,4,5], function(name) {
	console.log('get: '+ name);
});

_.each({one: 1, two: 2, three: 3}, function(k ,v) {
	console.log('get k: '+k+' v: '+v);
});
=> get k: 1 v: one VM199:2
   get k: 2 v: two VM199:2
   get k: 3 v: three 

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
  console.log(this[name]);
}, person.friends);


----------------------------------
map _.map(list, iterator, [context]) Alias: collect 
----------------------------------
前面的_.each强调函数内的操作，类似于for循环，一般不会用到返回值
而 _.map 会返回函数逻辑作用后的结果，返回值很重要
_.map([1, 2, 3], function(num){ return num * 3; });
=> [3, 6, 9]
_.map({one: 1, two: 2, three: 3}, function(num, key){ return num * 3; });
=> [3, 6, 9]

----------------------------------
reduce _.reduce(list, iterator, memo, [context]) Aliases: inject, foldl 
----------------------------------
类似ruby中的inject
var sum = _.reduce([1, 2, 3], function(memo, num){ return memo + num; }, 0);//这里的 0 表示初始值
=> 6

还有个reduceRight
list = [[0, 1], [2, 3], [4, 5]];
var flat = _.reduceRight(list, function(a, b) { return a.concat(b); }, []);
=> [4, 5, 2, 3, 0, 1]

----------------------------------
find _.find(list, predicate, [context]) Alias: detect 
在list中逐项查找，返回第一个通过predicate迭代函数真值检测的元素值，如果没有值传递给测试迭代器将返回undefined。 如果找到匹配的元素，函数将立即返回，不会遍历整个list。

var even = _.find([1, 2, 3, 4, 5, 6], function(num){ return num % 2 == 0; });
=> 2
filter _.filter(list, predicate, [context]) Alias: select 
遍历list中的每个值，返回包含所有通过predicate真值检测的元素值。（如果存在原生filter方法，则用原生的filter方法。）

var evens = _.filter([1, 2, 3, 4, 5, 6], function(num){ return num % 2 == 0; });
=> [2, 4, 6]

----------------------------------


----------------------------------
where
----------------------------------







