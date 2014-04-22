$(document).ready(function(){
	todoList = new TodoList();

	todoListView = new TodoListView({collection:todoList});
	todoListView.render();

	var newTodoItem = new TodoItem({description: "Item 1", status: "complete"});
	todoList.add(newTodoItem);

	todoList.fetch();
});