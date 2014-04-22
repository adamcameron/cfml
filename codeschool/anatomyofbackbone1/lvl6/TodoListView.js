var TodoListView = Backbone.View.extend({
	initialize	: function(){
		this.collection.on("add", this.addOne, this);
		this.collection.on("reset", this.addAll, this);
	},
	render		: function(){
		this.addAll();
	},
	addAll		: function(){
		this.collection.each(this.addOne, this);
	},
	addOne		: function(todoItem){
		var todoView = new TodoView({model:todoItem});
		this.$el.append(todoView.render().el);
	},
	el	: "#results"
});