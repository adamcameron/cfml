var TodoItem = Backbone.Model.extend({
	urlRoot			: "/rest/api/todo"
});

var TodoView = Backbone.View.extend({
	render	: function(){
		var html = "<h3>" + this.model.get("description") + "</h3>";
		this.$el.html(html);
	},
	el	: "#results"
});

todoItem = new TodoItem({id:1});
todoItem.fetch({
	success : function(item){
		todoView = new TodoView({model:item});
		todoView.render();
	}
});