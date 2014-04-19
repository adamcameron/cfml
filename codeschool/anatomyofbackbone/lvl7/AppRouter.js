var AppRouter = Backbone.Router.extend({
	initialize	: function(options){
		this.todoList = options.todoList;
	},
	routes		: {
		""			: "index",
		"todos/:id"	: "show"
	},
	index		: function(){
		console.log("home");
	},
	show		: function(id){
		this.todoList.focusOnTodoItem(id);
	}
});
