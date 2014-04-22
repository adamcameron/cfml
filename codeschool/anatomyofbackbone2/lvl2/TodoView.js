var TodoView = Backbone.View.extend({
	template	: _.template(
		'<h3 class="<%= status %>">'
		+ '<input type="checkbox" '
		+ '<% if(status === "complete") print("checked") %>/>'
		+ "<%= description %></h3>"
	),
	render		: function(){
		this.$el.html(this.template(this.model.attributes));
		return this;
	}

});