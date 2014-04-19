$(document).ready(function(){
	var TodoView = Backbone.View.extend({
		tagName		: "div",
		className	: "todo",
		id			: "todo-id",
		template	: _.template("<h3><%= description %></h3>"),
		render		: function(){
			var attributes = this.model.toJSON();
			this.$el.html(this.template(attributes));
			$("#results").html(this.$el.html());
		},
		events		: {
			"click h3"	: "alertStatus"
		},
		alertStatus	: function(e){
			alert(this.model.get("status"));
		}
	});

	var todoItem = new TodoItem(
		{description:"Pick up milk", status:"incomplete", "id":1}
	);

	var todoView = new TodoView({model:todoItem});

	todoView.render();

});