$(document).ready(function(){
	var todoList = new TodoList();

	todoList.on("reset", function(){
		console.log("=====reset=====");
		console.dir(arguments);
	});
	todoList.on("add", function(){
		console.log("=====add=====");
		console.dir(arguments);
	});

	console.log(todoList.length);

	todoList.add(new TodoItem({description:"item 1", status:"status 1"}));
	console.log(todoList.length);

	todoList.reset([
		{description:"new item 0", status:"new status 0"},
		{description:"new item 1", status:"new status 1"}
	],{silent:true});

	var todoList2 = new TodoList();
	todoList2.on("reset", function(){
		console.log("=====reset=====");
		console.dir(arguments);
	});

	todoList2.fetch();
});