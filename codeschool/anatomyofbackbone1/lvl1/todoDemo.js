$(document).ready(function(){
	var todoItem = new TodoItem(
		{description:"Pick up milk", status:"incomplete", "id":1}
	);

	var todoView = new TodoView({model:todoItem});
	todoView.render();
	console.log(todoView.el);
});