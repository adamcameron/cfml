var TodoListView = Backbone.View.extend({
	template	: _.template('<a href="#todos/p<%= page %>">next page</a>'),
	initialize	: function(){
		this.collection.on("reset", this.render, this);
	},
	render		: function(){
		this.addAll();
		this.$el.append(this.template({page:this.collection.page+1}));
		return this;
	},
	addAll		: function(){
		this.$el.empty();
		this.collection.forEach(this.addOne, this);
	},
	addOne		: function(todoItem){
		var todoView = new TodoView({model:todoItem});
		this.$el.append(todoView.render().el);
	},
	el	: "#results"
});