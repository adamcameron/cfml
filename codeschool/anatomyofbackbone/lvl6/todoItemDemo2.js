$(document).ready(function(){
	todoItem = new TodoItem({id:1});
	todoItem.fetch({
		success	: function(){
			var todoView = new TodoView({model:todoItem});
			todoView.render();
			console.log(todoView)
		}
	});
});