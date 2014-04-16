$(document).ready(function(){
	console.clear();
	var todoList = new TodoList();
	todoList.fetch();
	
	var todoListView = new TodoListView({
		collection	: todoList,
		el			: "#results"
	});

	todoListView.render();
	//console.log(todoListView.el);
});