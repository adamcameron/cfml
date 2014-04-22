$(document).ready(function(){
	var todoItem = new TodoItem({
		id			: 2,
		description	: "updated by abbreviated put from JS again",
		status		: "complete"
	});
	todoItem.save();

});