$(document).ready(function(){

	todoItemStd = new TodoItem({id:3, description:"third item descr.", status:"complete"});
	console.dir(todoItemStd.attributes);

	todoItemNew = new TodoItem({
		todo	: {
			id			: 4,
			description	: "fourth todo",
			status		: "incomplete"
		}
	}, {parse:true});
	console.dir(todoItemNew.attributes);
});