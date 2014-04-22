$(document).ready(function(){
	var todoList = new TodoList();
	todoList.fetch({
		success	: function(){
			console.dir(todoList);
			console.log(todoList.toJSON());
		},
		data : {page:2,size:5}
	});
});