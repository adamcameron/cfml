var TodoListView = Backbone.View.extend({
	initialize	: function(){
		this.collection.on("add", this.addOne, this);
		this.collection.on("reset", this.addAll, this);
	},
	render		: function(){
		this.addAll();
	},
	addOne		: function(todoItem){
		var todoView = new TodoView({model:todoItem});
		this.$el.append(todoView.render().el);
	},
	addAll		: function(){
		this.collection.each(this.addOne, this);
	},
	el	: "#results"
});