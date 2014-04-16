component rest=true restPath="dataservice" {

	variables.dataFile = getDirectoryFromPath(getCurrenttemplatePath()) & "todo.json"
	variables.todos = getAll()

	remote string function greet() httpmethod="GET" restpath="greet" {
		return "G'day world"
	}

	remote struct function getTodoItem(required numeric id restArgSource="path") httpmethod="GET" restPath="todo/{id}" {
		return variables.todos[id]
	}

	remote array function getTodoItems() httpmethod="GET" restPath="todos" {
		return variables.todos
	}

	remote void function putTodoItem(
		required numeric id			restArgSource="path",
		required string body	restArgSource="body"
	) httpmethod="PUT" restPath="todo/{id}" {
		variables.todos[id] = deserializeJson(body)
		putAll()
	}

	remote void function postTodoItem(
		required string body	restArgSource="body"
	) httpmethod="POST" restPath="todo" {
		var obj = deserializeJson(body);
		variables.todos[obj.id] = obj
		putAll()
	}

	remote void function deleteTodoItem(required numeric id restArgSource="path") httpmethod="DELETE" restPath="todo/{id}" {
		writeLog(file="DataService", text=serializeJson(arguments))
		variables.todos.deleteAt(id)
		putAll()
	}

	private array function getAll(){
		return deserializeJson(fileRead(variables.dataFile))
	}

	private void function putAll(){
		fileWrite(variables.dataFile, serializeJson(variables.todos))
	}

}