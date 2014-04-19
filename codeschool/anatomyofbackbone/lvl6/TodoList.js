var TodoList = Backbone.Collection.extend({
	initialize	: function(){
		this.on("remove", this.hideModel)
	},
	hideModel	: function(model){
		model.trigger("hide");
	},
	url		: "/rest/api/todo/",
	model	: TodoItem
});