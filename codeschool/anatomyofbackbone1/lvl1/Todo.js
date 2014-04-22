//TodoItem.js
var TodoItem = Backbone.Model.extend({});

var TodoView = Backbone.View.extend({
	render	: function(){
		var html = "<h3>" + this.model.get("description") + "</h3>";
		$(this.el).html(html);
	}
});