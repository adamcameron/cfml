var TodoList = Backbone.Collection.extend({
	comparator	: function(e1,e2){
		return e1.get("status") < e2.get("status")
	},
	completedCount	: function(){
		return this.where({status:"complete"}).length;
	},
	url		: "/rest/api/todo/page",
	parse	: function(response){
		this.perPage	= parseInt(response.per_page, 10);
		this.page		= parseInt(response.page, 10);
		this.total		= parseInt(response.total, 10);
		return response.todos;
	}
});