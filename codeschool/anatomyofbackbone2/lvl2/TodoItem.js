var TodoItem = Backbone.Model.extend({
	//idAttribute: "_id",
	urlRoot			: "/rest/api/todo/abbrev",
	parse			: function(response){
		return response.todo;
	},
	toJSON			: function(){
		var attrs = _.clone(this.attributes);
		attrs.i = attrs.id;
		attrs.d = attrs.description;
		attrs.s = attrs.status;
		attrs = _.pick(attrs, "i", "d", "s");
		return attrs;
	}
});
