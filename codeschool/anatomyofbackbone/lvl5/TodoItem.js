//TodoItem.js
var TodoItem = Backbone.Model.extend({
	urlRoot			: "/rest/api/dataservice/todo/",
	element			: "#results",
	defaults		: {
		description	: "default description",
		status		: "incomplete"
	},
	toggleStatus	: function(){
		if (this.get("status") === "incomplete") {
			this.set({status:"complete"});
		}else{
			this.set({status:"incomplete"});
		}
		//this.save();
		console.log(this.toJSON())
	}
});

var TodoView = Backbone.View.extend({
	render	: function(){
		var html = "<h3>" + this.model.get("description") + "</h3>";
		this.$el.html(html);
	}
});