$(document).ready(function(){
	var todoItem = new TodoItem({id:2});
	todoItem.fetch({
		success : function(todoItem){

			todoItem.set({description: "Updated by Backbone"});
			todoItem.save();

			var todoView = new TodoView({model:todoItem});
			todoView.render();
		}
	});

	var anotherTodo = new TodoItem();
	anotherTodo.on("change", function(){
		console.log("change triggered")
		console.dir(arguments)
	})

	anotherTodo.set({id:8})
	anotherTodo.set({description:"item 8 description"}, {silent:true})
	//console.dir(anotherTodo)
	//anotherTodo.save()
	anotherTodo.on("foo",function(){
		console.log("foo fired")
	})
	anotherTodo.trigger("foo", {stuff:"here"})

});