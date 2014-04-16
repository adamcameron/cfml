var TodoListView = Backbone.View.extend({
	initialize	: function(){
		this.collection.each(function(){
			console.log("hi")
		});
	},
	render	: function(){
		console.log("in render()")
		this.collection.each(
			function(item){
				console.log("each()")
			}
		);
	}

});