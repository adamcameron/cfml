$(document).ready(function(){
	var todoItem = new TodoItem();
	todoItem.url = "todo.json";
	todoItem.fetch();

	console.log(todoItem);
	console.log(todoItem.get());

	//var todoView = new TodoView({model:todoItem});
	//todoView.render();
	//console.log(todoView.el);
});