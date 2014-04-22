var TodoApp = new (Backbone.Router.extend({
	routes		: {
		""				: "index",
		"todos/p:page"	: "page"
	},
	initialize	: function(){
		this.todoList = new TodoList();
		this.todoListView = new TodoListView({collection:this.todoList});
		this.todoListView.render();
		$("#app").append(this.todoListView.el);
	},
	index		: function(){
		var todoList = this.todoList;
		todoList.fetch({
			success	: function(){
			}
		});
	},
	page		: function(page){
		this.todoList.fetch({data:{page:page}})
	}
}));