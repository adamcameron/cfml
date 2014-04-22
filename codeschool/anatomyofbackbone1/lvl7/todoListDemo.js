$(document).ready(function(){
	var todoList = new TodoList();

	var appRouter = new AppRouter({todoList:todoList});
	Backbone.history.start();

/*
	appRouter.navigate("todos/6",{
		trigger	: true
	});
*/
});