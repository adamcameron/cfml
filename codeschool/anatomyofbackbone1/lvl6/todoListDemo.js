$(document).ready(function(){
	todoList = new TodoList();
	todoList.fetch({
		success	: function(){
			todoListView = new TodoListView({collection:todoList});
			todoListView.render();
/*
			var newTodoItem = new TodoItem({description: "hi", status: "there"});
			todoList.add(newTodoItem);
*/
		}
	});

});