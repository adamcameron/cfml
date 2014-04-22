var TodoList = Backbone.Collection.extend({
	url		: "/rest/api/dataservice/todos/",
	model	: TodoItem
});