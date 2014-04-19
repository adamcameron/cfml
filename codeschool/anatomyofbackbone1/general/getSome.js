var TodoItem = Backbone.Model.extend({
	urlRoot : "/rest/api/todo"
});

var TodoList = Backbone.Collection.extend({
	model	: TodoItem,
	url		: "/rest/api/todo"
});


var TodoItemView = Backbone.View.extend({
	render	: function(){
		var html = "<li>" + this.model.get("description") + "</li>";
		this.$el.html(html);
	}
});


var TodoListView = Backbone.View.extend({
	tagName: "ul",

	render: function(){
		this.collection.each(this.addOne, this);
	},
	addOne: function(item){
		//console.dir(item)
		var itemView = new TodoItemView({model:item});
		console.dir(itemView);
		// var rendered = itemView.render().el;
		//console.log(rendered);
		//this.$el.append();
		//itemView.render();
	},
	el	: "#results"
});




todoList = new TodoList();
todoList.fetch({
	success : function(){
		todoListView = new TodoListView({collection:todoList});
		todoListView.render();
	}
});