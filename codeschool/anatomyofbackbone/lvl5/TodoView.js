var TodoView = Backbone.View.extend({
	template	: _.template(
		'<h3 class="<%= status %>">'
		+ '<input type="checkbox" '
		+ '<% if(status === "complete") print("checked") %>/>'
		+ "<%= description %></h3>"
	),
	render		: function(){
		this.$el.html(this.template(this.model.toJSON()));
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

