var TodoItem = Backbone.Model.extend({
	urlRoot		: "/rest/api/dataservice/todo/",
	defaults	: {
		description	: "default description",
		status		: "incomplete"
	}
});

var TodoView = Backbone.View.extend({
	el		: "#result",
	render	: function(){
		var html = "<h3>" + this.model.get("description") + "</h3>";
		this.$el.html(html);
	}
});