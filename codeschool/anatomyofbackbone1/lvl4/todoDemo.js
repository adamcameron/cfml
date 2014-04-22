$(document).ready(function(){
	var TodoView = Backbone.View.extend({
		template	: _.template(
			'<h3 class="<%= status %>">'
			+ '<input type="checkbox" '
			+ '<% if(status === "complete") print("checked") %>/>'
			+ "<%= description %></h3>"
		),
		render		: function(){
			this.$el.html(this.template(this.model.toJSON()));
			console.log("render() called")
		},
		events			: {
			"change input" : "toggleStatus"
		},
		initialize		: function(){
			this.model.on("change", this.render, this);
		},
		toggleStatus	: function(){
			this.model.toggleStatus();
		},
		el				: "#results"

	});

	var todoItem = new TodoItem(
		{description:"Pick up milk again", status:"incomplete", "id":1}
	);

	var todoView = new TodoView({model:todoItem});

	todoView.render();
	console.log(todoView.el);

	todoItem.toggleStatus();
	todoItem.toggleStatus();
});