var TodoItem = Backbone.Model.extend({
	initialize		: function(){
		this.on("hide", this.remove, this);
	},
	urlRoot			: "/rest/api/todo"
});
